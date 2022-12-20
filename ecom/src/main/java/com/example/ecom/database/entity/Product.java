package com.example.ecom.database.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table
@Getter
@Setter
@NoArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    private Long id;

    @Column
    private String title;

    @Column
    private String description;

    @Column
    private Float price;

    @Column
    private String brand;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private ProductCategory category;

    @Column
    private String thumbnail;

    @Column
    private List<String> images = new ArrayList<>();

    @Column(updatable = false)
    @CreationTimestamp
    private Date createdAt;
}
