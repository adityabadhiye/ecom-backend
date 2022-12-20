package com.example.ecom.database.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.util.Date;

@Entity
@Table(name="users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    private Long id;

    @Column
    private String fullName;

    @Column
    private String email;

    @Column
    private String password;

//    TODO: ADD ADDRESS, ORDERS, CART ...
//    @Column
//    private Address address;
//
//    @Column
//    private List<Order> orders;
//
    @OneToOne(mappedBy = "user",cascade = CascadeType.ALL)
    private Cart cart;

    @Column(updatable = false)
    @CreationTimestamp
    private Date createdAt;
}
