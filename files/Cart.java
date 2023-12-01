package com.tdd.domain.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private final List<Product> products;

    public Cart() {
        this.products = new ArrayList<>();
    }

    public List<Product> getProducts() {
        return products;
    }

    public void addProduct(String name, boolean isPrimeEligible) {
        this.products.add(new Product(name, isPrimeEligible));
    }
}
