package com.example.ecom.util;

import java.util.List;

public class Constant {
    public static final String[] PUBLIC_URLS={
            "/login","/products","/product/**","/category","/register",
            "/v3/api-docs/**","swagger-resources/**","/swagger-ui/**",
            "/v2/api-docs/**","webjars/**","/webhook/stripe-events"
    };
    public static final List<String> PUBLIC_URLS_LIST = List.of(PUBLIC_URLS);
    public static final String DEFAULT_PAGE_SIZE = "25";
    public static final String DEFAULT_PAGE_NUMBER = "1";
    public static final String DEFAULT_SORT_BY = "id";
    public static final String DEFAULT_ASC = "true";
}
