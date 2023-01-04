package com.example.ecom.api.request;

import jakarta.validation.constraints.*;
import lombok.Data;

@Data
public class RegisterRequest {
    @NotBlank
    @Min(3)
    @Max(52)
    private String fullName;

    @NotBlank
    @Max(52)
    @Pattern(regexp = "^\\w+([.-]?\\w+)*@\\w+([.-]?\\w+)*(\\.\\w{2,3})+$", message = "Invalid Email")
    private String email;

    @NotBlank
    @Min(6)
    @Max(52)
    private String password;
}
