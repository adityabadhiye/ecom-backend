package com.example.ecom.database.repository;

import com.example.ecom.database.entity.ProductCategory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends CrudRepository<ProductCategory,Long> {
    ProductCategory findByName(String name);
}
