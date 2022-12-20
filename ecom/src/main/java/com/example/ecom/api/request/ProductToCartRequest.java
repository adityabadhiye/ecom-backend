package com.example.ecom.api.request;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class ProductToCartRequest {
    @NotBlank
    private Long productId;
    @NotBlank
    private Integer quantity;
}
