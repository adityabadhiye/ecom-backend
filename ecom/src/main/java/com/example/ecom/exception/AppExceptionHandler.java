package com.example.ecom.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;
import java.util.Map;

@RestControllerAdvice
public class AppExceptionHandler {

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Map<String, Object> handleInvalidArg(MethodArgumentNotValidException e){
        Map<String,Object> errorResponse = new HashMap<>();
        e.getBindingResult().getFieldErrors().forEach(error->{
            errorResponse.put(error.getField(),error.getDefaultMessage());
        });
        errorResponse.put("error","validation error");
        return errorResponse;
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(CommonAPIException.class)
    public Map<String,String> handleCommonAPIException(CommonAPIException e){
        Map<String,String> errorResponse = new HashMap<>();
        errorResponse.put("error",e.getMessage());
        return errorResponse;
    }
}
