package com.tdd.domain.model;

public class Product {

    private String name;
    private boolean isPrimeEligible;

    public Product(String name, boolean isPrimeEligible) {
        this.name = name;
        this.isPrimeEligible = isPrimeEligible;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isPrimeEligible() {
        return isPrimeEligible;
    }

    public void setPrimeEligible(boolean primeEligible) {
        isPrimeEligible = primeEligible;
    }
}
