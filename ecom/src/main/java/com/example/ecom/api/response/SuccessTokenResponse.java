package com.example.ecom.api.response;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class SuccessTokenResponse {
    private AccountResponse user;
    private String token;
}
