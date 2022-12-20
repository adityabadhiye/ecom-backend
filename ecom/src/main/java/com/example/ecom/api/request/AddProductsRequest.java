package com.example.ecom.api.request;

import lombok.Data;

@Data
public class AddProductsRequest {
    private String title;
    private String brand;
    private String category;
    private float price;
    private String[] imgs;
    private String[] specs;
}
