package com.example.ecom.api.controller;

import com.example.ecom.api.request.AddProductsRequest;
import com.example.ecom.database.entity.Product;
import com.example.ecom.database.entity.ProductCategory;
import com.example.ecom.database.repository.CategoryRepository;
import com.example.ecom.database.repository.ProductRepository;
import com.example.ecom.service.ProductService;
import com.example.ecom.util.Constant;
import jdk.jfr.Category;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.Arrays;
import java.util.Optional;

@RestController
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private ProductRepository productRepository;

//    @PostMapping(value = "/products")
//    public ResponseEntity<String> addProducts(
//            @RequestBody AddProductsRequest[] requests
//    ){
//        for(AddProductsRequest r:requests){
//            Product p = new Product();
//            p.setTitle(StringUtils.left(r.getTitle(),255));
//            p.setBrand(StringUtils.left(r.getBrand(),255));
//            ProductCategory c = categoryRepository.findByName(r.getCategory());
//            p.setCategory(c);
//            p.setThumbnail(r.getImgs()[0]);
//            for(String i: r.getImgs())
//                p.getImages().add(i);
//            p.setPrice(r.getPrice());
//            StringBuilder desc= new StringBuilder();
//            for(String s:r.getSpecs()){
//                desc.append(s);
//                desc.append(' ');
//            }
//
//            p.setDescription(StringUtils.left(desc.toString(),255));
//            productRepository.save(p);
//        }
//        return ResponseEntity.ok("success");
//    }

    @GetMapping(value = "/products")
    public ResponseEntity<Page<Product>> getAllProducts(
            @RequestParam(value = "cat", required = false) String category,
            @RequestParam(value = "search", required = false) String search,
            @RequestParam(value = "sort_by", defaultValue = Constant.DEFAULT_SORT_BY, required = false) String sortBy,
            @RequestParam(value = "asc", defaultValue = Constant.DEFAULT_ASC, required = false) boolean ascSort,
            @RequestParam(value = "page_size", defaultValue = Constant.DEFAULT_PAGE_SIZE, required = false) int pageSize,
            @RequestParam(value = "page", defaultValue = Constant.DEFAULT_PAGE_NUMBER, required = false) int pageNo,
            @RequestParam(value = "min", defaultValue = "0", required = false) int minPrice,
            @RequestParam(value = "max", defaultValue = "10000", required = false) int maxPrice) {
        Page<Product> products = productService.getAllProducts(category,search,sortBy,ascSort,pageSize,pageNo,minPrice,maxPrice);
        return new ResponseEntity<>(products, HttpStatus.OK);
    }

    @GetMapping(value = "/product/{id}")
    public ResponseEntity<Product> getAllProducts(
            @PathVariable(name = "id") Long productId) {
        Optional<Product> p = productService.getProductById(productId);
        if(p.isPresent())
            return new ResponseEntity<>(p.get(), HttpStatus.OK);
        throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Product not found!");
    }
}
