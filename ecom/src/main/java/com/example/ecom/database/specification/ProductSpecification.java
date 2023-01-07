package com.example.ecom.database.specification;

import com.example.ecom.database.entity.Product;
import com.example.ecom.database.entity.ProductCategory;
import jakarta.persistence.criteria.*;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import java.util.LinkedList;
import java.util.List;

@Component
public class ProductSpecification {
    public Specification<Product> doFilterSearchSort(String category, String search,
                                                     String sortBy, boolean ascSort,
                                                     float minPrice, float maxPrice){
        return (Root<Product> root, CriteriaQuery<?> cq, CriteriaBuilder cb) -> {
            List<Predicate> predicates = new LinkedList<>();
            predicates.add(cb.greaterThanOrEqualTo(root.get("price"),minPrice));
            predicates.add(cb.lessThanOrEqualTo(root.get("price"),maxPrice));
            if (search != null)
                predicates.add(cb.like(cb.lower(root.<String>get("title")), "%" + search.toLowerCase() + "%"));
            if (category!=null)
                predicates.add(cb.equal(root.<ProductCategory>get("category").<String>get("name"),category));

            Path<Product> orderClause = root.get(sortBy);

            if (ascSort) {
                cq.orderBy(cb.asc(orderClause));
            } else {
                cq.orderBy(cb.desc(orderClause));
            }

            return cb.and(predicates.toArray(new Predicate[]{}));
        };
    }
}
