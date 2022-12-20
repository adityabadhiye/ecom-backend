package com.example.ecom.service;

import com.example.ecom.database.entity.ProductCategory;
import com.example.ecom.database.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryService {
    @Autowired
    CategoryRepository categoryRepository;

    public List<ProductCategory> getAllCategory(){
        List<ProductCategory> res = new ArrayList<>();
        categoryRepository.findAll().forEach(res::add);
        return res;
    }
}
