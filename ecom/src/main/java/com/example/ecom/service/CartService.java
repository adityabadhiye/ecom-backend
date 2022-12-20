package com.example.ecom.service;

import com.example.ecom.database.entity.Cart;
import com.example.ecom.database.entity.CartItem;
import com.example.ecom.database.entity.Product;
import com.example.ecom.database.repository.CartRepository;
import com.example.ecom.database.repository.ProductRepository;
import com.example.ecom.exception.CommonAPIException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CartService {
    @Autowired
    UserService userService;

    @Autowired
    CartRepository cartRepository;
    @Autowired
    private ProductRepository productRepository;

    public Cart getCart() {
        return userService.getUserDetails().getCart();
    }

    public void addProductQuantity(Long productId, Integer quantity) throws CommonAPIException {
        Cart cart = getCart();
        Optional<CartItem> cartItem = cart.getCartItemList()
                .stream()
                .filter(ci->ci.getProduct().getId().equals(productId))
                .findFirst();
        if(cartItem.isPresent()){
            cartItem.get().setQuantity(cartItem.get().getQuantity()+quantity);
            updatePrice(cart);
            cartRepository.save(cart);
            return;
        }
        CartItem newCartItem = new CartItem();
        Optional<Product> product = productRepository.findById(productId);
        if(product.isEmpty())
            throw new CommonAPIException("product not present");
        newCartItem.setProduct(product.get());
        newCartItem.setQuantity(quantity);
        newCartItem.setCart(cart);
        cart.getCartItemList().add(newCartItem);
        updatePrice(cart);
        cartRepository.save(cart);
    }

    public void deleteProduct(long productId) {
        Cart cart = getCart();
        Optional<CartItem> cartItem = cart.getCartItemList()
                .stream()
                .filter(ci->ci.getProduct().getId().equals(productId))
                .findFirst();
        if(cartItem.isPresent()){
            cart.getCartItemList().remove(cartItem.get());
            updatePrice(cart);
            cartRepository.save(cart);
        }
    }

    public void setProductQuantity(Long productId, Integer quantity) throws CommonAPIException {
        Cart cart = getCart();
        Optional<CartItem> cartItem = cart.getCartItemList()
                .stream()
                .filter(ci->ci.getProduct().getId().equals(productId))
                .findFirst();
        if(cartItem.isPresent()){
            cartItem.get().setQuantity(quantity);
            updatePrice(cart);
            cartRepository.save(cart);
            return;
        }
        CartItem newCartItem = new CartItem();
        Optional<Product> product = productRepository.findById(productId);
        if(product.isEmpty())
            throw new CommonAPIException("product not present");
        newCartItem.setProduct(product.get());
        newCartItem.setQuantity(quantity);
        newCartItem.setCart(cart);
        cart.getCartItemList().add(newCartItem);
        updatePrice(cart);
        cartRepository.save(cart);
    }

    private void updatePrice(Cart cart) {
        float total=0f;
        for(CartItem cartItem:cart.getCartItemList()){
            total+=cartItem.getProduct().getPrice()*cartItem.getQuantity();
        }
        cart.setTotalCartPrice(total);
        cart.setTotalPrice(total);
    }

    public boolean isCartEmpty(){
        return getCart().getCartItemList().isEmpty();
    }

    public void clear() {
        Cart cart = getCart();
        cart.getCartItemList().clear();
        updatePrice(cart);
        cartRepository.save(cart);
    }
}
