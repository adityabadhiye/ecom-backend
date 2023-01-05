package com.example.ecom.api.response;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class SuccessResponse<T> {
    private final T data;
    private final boolean success = true;
}
