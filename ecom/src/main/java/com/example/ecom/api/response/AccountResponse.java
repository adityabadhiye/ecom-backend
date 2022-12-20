package com.example.ecom.api.response;

import com.example.ecom.database.entity.Cart;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountResponse {
    private Long id;
    private String fullName;
    private String email;
}
