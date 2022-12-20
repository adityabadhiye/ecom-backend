package com.example.ecom.database.repository;

import com.example.ecom.database.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long>,PagingAndSortingRepository<Product,Long>, JpaSpecificationExecutor<Product> {
    Optional<Product> findById(Long productId);
}
