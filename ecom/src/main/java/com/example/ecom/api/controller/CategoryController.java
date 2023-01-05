package com.example.ecom.api.controller;

import com.example.ecom.api.response.SuccessResponse;
import com.example.ecom.database.entity.ProductCategory;
import com.example.ecom.database.repository.CategoryRepository;
import com.example.ecom.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CategoryController {
    @Autowired
    CategoryService productCategoryService;
    @Autowired
    private CategoryRepository categoryRepository;

    @GetMapping(value = "/category")
    public ResponseEntity<SuccessResponse<List<ProductCategory>>> getAllCategories() {
        List<ProductCategory> productCategories = productCategoryService.getAllCategory();
        return ResponseEntity.ok(new SuccessResponse<>(productCategories));
    }

//    @PostMapping(value = "/category")
//    public ResponseEntity<String> addCategories(
//            @RequestBody String[] request
//    ){
//        for(String r:request){
//            ProductCategory c = new ProductCategory();
//            c.setName(r);
//            categoryRepository.save(c);
//        }
//        return ResponseEntity.ok("success");
//    }
}
