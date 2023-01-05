package com.example.ecom.api.controller;

import com.example.ecom.api.request.ProductToCartRequest;
import com.example.ecom.api.response.SuccessResponse;
import com.example.ecom.database.entity.Cart;
import com.example.ecom.exception.CommonAPIException;
import com.example.ecom.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import static java.lang.Math.max;

@RestController
public class CartController {
    @Autowired
    CartService cartService;

    @GetMapping(path = "/cart")
    public ResponseEntity<Cart> getCart(){
        return ResponseEntity.ok(cartService.getCart());
    }

    @PostMapping(path = "/cart/add")
    public ResponseEntity<SuccessResponse<Cart>> addProduct(
            @RequestBody ProductToCartRequest request
    ) throws CommonAPIException {
        cartService.addProductQuantity(request.getProductId(), max(request.getQuantity(),1));
        return ResponseEntity.ok(new SuccessResponse<>(cartService.getCart()));
    }

    @DeleteMapping(path = "/cart")
    public ResponseEntity<SuccessResponse<Cart>> deleteProduct(
            @RequestParam(value = "product_id") long productId
    ){
        cartService.deleteProduct(productId);
        return ResponseEntity.ok(new SuccessResponse<>(cartService.getCart()));
    }

    @PutMapping(path = "/cart")
    public ResponseEntity<SuccessResponse<Cart>> setProduct(
            @RequestBody ProductToCartRequest request
    ) throws CommonAPIException {
        cartService.setProductQuantity(request.getProductId(), max(request.getQuantity(),1));
        return ResponseEntity.ok(new SuccessResponse<>(cartService.getCart()));
    }
}
