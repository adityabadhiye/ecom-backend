package com.example.ecom.api.request;

import jakarta.validation.constraints.*;
import lombok.Data;

@Data
public class RegisterRequest {
    @NotBlank
    @Size(min = 3,max = 52)
    private String fullName;

    @NotBlank
    @Size(max = 52)
    @Pattern(regexp = "^\\w+([.-]?\\w+)*@\\w+([.-]?\\w+)*(\\.\\w{2,3})+$", message = "Invalid Email")
    private String email;

    @NotBlank
    @Size(min = 6,max = 52)
    private String password;
}
