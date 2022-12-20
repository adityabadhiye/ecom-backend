package com.example.ecom.api.response;

import com.example.ecom.database.entity.OrderStatus;
import com.example.ecom.database.entity.PaymentStatus;
import lombok.Data;

import java.util.Date;

@Data
public class OrderListItemResponse {
    private Long id;
    private Float totalPrice;
    private PaymentStatus paymentStatus;
    private OrderStatus orderStatus;
    private Date createdAt;
}
