package com.example.ecom.service;

import com.example.ecom.database.entity.Product;
import com.example.ecom.database.repository.ProductRepository;
import com.example.ecom.database.specification.ProductSpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ProductService {

    @Autowired
    ProductRepository productRepository;

    @Autowired
    ProductSpecification productSpecification;

    public Page<Product> getAllProducts(String category, String search, String sortBy,
                                        boolean ascSort, int pageSize, int pageNo,
                                        float minPrice, float maxPrice) {
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        Specification<Product> spec = productSpecification
                .doFilterSearchSort(category, search, sortBy, ascSort, minPrice, maxPrice);
        return productRepository.findAll(spec,pageable);
    }

    public Optional<Product> getProductById(Long productId) {
        return productRepository.findById(productId);
    }
}
