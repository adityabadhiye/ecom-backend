package com.example.ecom.api.controller;

import com.example.ecom.api.request.CreateOrderRequest;
import com.example.ecom.api.response.CreateOrderResponse;
import com.example.ecom.api.response.OrderDetailResponse;
import com.example.ecom.api.response.OrderListItemResponse;
import com.example.ecom.api.response.SuccessResponse;
import com.example.ecom.database.entity.Order;
import com.example.ecom.exception.CommonAPIException;
import com.example.ecom.service.CartService;
import com.example.ecom.service.OrderService;
import com.example.ecom.util.Constant;
import com.stripe.exception.StripeException;
import jakarta.validation.Valid;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class OrderController {
    @Autowired
    OrderService orderService;

    @Autowired
    CartService cartService;

    @Autowired
    ModelMapper modelMapper;

    @PostMapping(path = "/create-order")
    public ResponseEntity<SuccessResponse<CreateOrderResponse>> createOrder(
            @RequestBody @Valid CreateOrderRequest request
    ) throws CommonAPIException, StripeException {
        if(cartService.isCartEmpty())
            throw new CommonAPIException("No products added");
        Order order = orderService.createOrderFromCart();
        order.setAddress1(request.getAddress1());
        order.setAddress2(request.getAddress2());
        order.setCity(request.getCity());
        order.setState(request.getState());
        order.setCountry(request.getCountry());
        order.setZip(request.getZip());
        order.setOrderNotes(request.getOrderNotes());
        order.setPhone(request.getPhone());
        orderService.save(order);
        cartService.clear();
        String sessionId = orderService.createPaymentSession(order.getId());
        return ResponseEntity.ok(new SuccessResponse<>(new CreateOrderResponse(sessionId)));
    }

    @GetMapping(path = "/order")
    public ResponseEntity<SuccessResponse<OrderDetailResponse>> getOrderDetail(
            @RequestParam(value = "order_id") long orderId
    ) throws CommonAPIException {
        Order order = orderService.getOrderDetail(orderId);
        return ResponseEntity.ok(new SuccessResponse<>(modelMapper.map(order,OrderDetailResponse.class)));
    }

    @GetMapping(path = "/orders")
    public ResponseEntity<SuccessResponse<Page<OrderListItemResponse>>> getOrderDetail(
            @RequestParam(value = "page_size", defaultValue = Constant.DEFAULT_PAGE_SIZE, required = false) int pageSize,
            @RequestParam(value = "page", defaultValue = Constant.DEFAULT_PAGE_NUMBER, required = false) int pageNo
    ) {
        return ResponseEntity.ok(new SuccessResponse<>(orderService.getAllOrders(pageSize, pageNo)));
    }
}
