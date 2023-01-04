package com.example.ecom.exception;

import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;
import java.util.Map;

@RestControllerAdvice
public class AppExceptionHandler {

//    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Map<String, Object> handleInvalidArg(MethodArgumentNotValidException e){
        Map<String,Object> errorResponse = new HashMap<>();
        errorResponse.put("success",false);
        errorResponse.put("error","validation error");
        for (FieldError error : e.getBindingResult().getFieldErrors()) {
            errorResponse.put(error.getField(), error.getDefaultMessage());
        }
        return errorResponse;
    }

//    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(CommonAPIException.class)
    public Map<String,Object> handleCommonAPIException(CommonAPIException e){
        Map<String,Object> errorResponse = new HashMap<>();
        errorResponse.put("success",false);
        errorResponse.put("error",e.getMessage());
        return errorResponse;
    }
}
