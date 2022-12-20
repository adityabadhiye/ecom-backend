package com.example.ecom.api.controller;

import com.example.ecom.api.request.LoginRequest;
import com.example.ecom.api.request.RegisterRequest;
import com.example.ecom.api.response.AccountResponse;
import com.example.ecom.api.response.SuccessTokenResponse;
import com.example.ecom.database.entity.User;
import com.example.ecom.exception.CommonAPIException;
import com.example.ecom.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping(path = "/account")
    public ResponseEntity<AccountResponse> getUserDetails() {
        User user = userService.getUserDetails();
        AccountResponse response = userService.userToAccountResponse(user);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping(path = "/login")
    public ResponseEntity<SuccessTokenResponse> login(
            @RequestBody @Valid LoginRequest loginRequest
    ) throws CommonAPIException {
        String token = userService.login(loginRequest.getEmail(),loginRequest.getPassword());
        return ResponseEntity.ok(new SuccessTokenResponse(token,true));
    }

    @PostMapping(path = "/register")
    public ResponseEntity<SuccessTokenResponse> register(
            @RequestBody @Valid RegisterRequest registerRequest
    ) throws CommonAPIException {
        String token = userService.register(registerRequest.getFullName(),registerRequest.getEmail(),registerRequest.getPassword());
        return ResponseEntity.ok(new SuccessTokenResponse(token,true));
    }

}
