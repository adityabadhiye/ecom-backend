package com.example.ecom.api.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Data
public class CreateOrderRequest {
    @NotBlank
    private String address1;

    private String address2;
    @NotBlank
    private String city;
    @NotBlank
    private String state;
    @NotBlank
    @Pattern(regexp = "^\\d{6}$")
    private String zip;
    @NotBlank
    private String country;
    @NotBlank
    @Pattern(regexp = "^\\d{10}$")
    private String phone;

    private String orderNotes;
}
