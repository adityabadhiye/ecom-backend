package com.example.ecom.service;

import com.example.ecom.api.response.OrderListItemResponse;
import com.example.ecom.database.entity.*;
import com.example.ecom.database.repository.OrderRepository;
import com.example.ecom.exception.CommonAPIException;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.support.PageableExecutionUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
//@Slf4j
public class OrderService {
    @Autowired
    OrderRepository orderRepository;

    @Autowired
    UserService userService;

    @Autowired
    CartService cartService;

    @Autowired
    ModelMapper modelMapper;

    @Value("${stripe.api.key}")
    public String stripeKey;

    private final long JWT_VALIDITY = 60*30;
    private final String SUCCESS_URL = "http://64.227.156.184/orders";
    private final String FAILURE_URL = "http://64.227.156.184/orders";

    public Order createOrderFromCart() {
        Order order = new Order();
        order.setUser(userService.getUserDetails());
        order.setOrderStatus(OrderStatus.ORDERED);
        order.setPaymentStatus(PaymentStatus.UNPAID);
        Cart cart = cartService.getCart();
        for(CartItem cartItem:cart.getCartItemList()){
            OrderItem orderItem = OrderItem.builder()
                    .order(order)
                    .product(cartItem.getProduct())
                    .quantity(cartItem.getQuantity())
                    .build();
            order.getOrderItemList().add(orderItem);
        }
        order.setTotalOrderPrice(cart.getTotalCartPrice());
        order.setTotalPrice(cart.getTotalPrice());
        return order;
    }

    public void save(Order order) {
        orderRepository.save(order);
    }

    public Order getOrderDetail(long orderId) throws CommonAPIException {
//        Optional<Order> order = orderRepository.findById(orderId);
        Optional<Order> order = orderRepository.findByIdAndUserId(orderId,userService.getUserDetails().getId());
        if(order.isEmpty())
            throw new CommonAPIException("Order not found");
//        order.get().getUser()
        return order.get();
    }

    public Page<OrderListItemResponse> getAllOrders(int pageSize, int pageNo) {
        Pageable pageable = PageRequest.of(
                pageNo - 1, pageSize, Sort.by(Sort.Direction.DESC,"id")
        );
        Page<Order> order = orderRepository.findAllByUserId(userService.getUserDetails().getId(),pageable);
        List<OrderListItemResponse> list= order.get()
                                .map(o -> modelMapper.map(o, OrderListItemResponse.class))
                                .toList();
        return PageableExecutionUtils.getPage(
                list,
                pageable,
                order::getTotalElements
        );
    }

    public String createPaymentSession(Long orderId) throws StripeException {
        Stripe.apiKey=stripeKey;
        List<CartItem> cartItems = cartService.getCart().getCartItemList();
        List<SessionCreateParams.LineItem> lineItems = new ArrayList<>();
        for(CartItem ci:cartItems){
            lineItems.add(
                    SessionCreateParams.LineItem.builder()
                            .setQuantity(Long.valueOf(ci.getQuantity()))
                            .setPriceData(
                                    SessionCreateParams.LineItem.PriceData.builder()
                                            .setUnitAmount((long) (ci.getProduct().getPrice()*100))
                                            .setCurrency("inr")
                                            .setProductData(
                                                    SessionCreateParams.LineItem.PriceData.ProductData.builder()
                                                            .setName(ci.getProduct().getTitle())
                                                            .build()

                                            )
                                            .build()
                            )
                            .build()
            );
        }
//        log.info(lineItems.toString());
        SessionCreateParams params =
                SessionCreateParams.builder()
                        .setMode(SessionCreateParams.Mode.PAYMENT)
                        .setSuccessUrl(SUCCESS_URL)
                        .setCancelUrl(FAILURE_URL)
                        .addAllLineItem(lineItems)
                        .setCustomerEmail(userService.getUserDetails().getEmail())
                        .setExpiresAt(System.currentTimeMillis()/1000+JWT_VALIDITY)
                        .setClientReferenceId(String.valueOf(orderId))
                        .build();
        Session session = Session.create(params);
//        log.info(session.getUrl());
        return session.getUrl();
    }

    public void successOrder(long orderId) {
        Optional<Order> o = orderRepository.findById(orderId);
        if(o.isPresent()){
            o.get().setPaymentStatus(PaymentStatus.SUCCESS);
            orderRepository.save(o.get());
        }
    }

    public void failOrder(long orderId) {
        Optional<Order> o = orderRepository.findById(orderId);
        if(o.isPresent()){
            o.get().setPaymentStatus(PaymentStatus.FAILED);
            orderRepository.save(o.get());
        }
    }
}
