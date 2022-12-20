package com.example.ecom.service;

import com.example.ecom.api.response.AccountResponse;
import com.example.ecom.database.entity.Cart;
import com.example.ecom.database.entity.User;
import com.example.ecom.database.repository.UserRepository;
import com.example.ecom.exception.CommonAPIException;
import com.example.ecom.util.JwtUtil;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    UserDetailsService userDetailsService;

    @Autowired
    JwtUtil jwtUtil;

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    PasswordEncoder passwordEncoder;

    public User getUserDetails() {
//      assuming username is successfully extracted from token
        String username = String.valueOf(SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        return userRepository.findByEmail(username).get();
    }

    public String login(String email, String pass) throws CommonAPIException {
        try{
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(email,pass));
        } catch (Exception e){
            throw new CommonAPIException("Invalid username or password");
        }
        UserDetails userDetails = userDetailsService.loadUserByUsername(email);
        return jwtUtil.generateToken(userDetails);
    }

    public String register(String fullName, String email, String pass) throws CommonAPIException {
//      check if user already exists
        if(userRepository.existsByEmail(email))
            throw new CommonAPIException("User already exists");
//      create user inside database
        User newUser = User.builder()
                        .fullName(fullName)
                        .email(email)
                        .password(passwordEncoder.encode(pass))
                        .build();
        Cart userCart = new Cart();
        userCart.setUser(newUser);
        newUser.setCart(userCart);
//      TODO:hash password
        userRepository.save(newUser);
        UserDetails userDetails = userDetailsService.loadUserByUsername(email);
        return jwtUtil.generateToken(userDetails);
    }

    public AccountResponse userToAccountResponse(User user){
        return modelMapper.map(user,AccountResponse.class);
    }
}
