package com.tdd.domain.model;

import java.util.UUID;

public class Customer {

    private String customerId;
    private boolean isPrime;

    public Customer(boolean isPrime) {
        this.customerId = UUID.randomUUID().toString();
        this.isPrime = isPrime;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public boolean isPrime() {
        return isPrime;
    }

    public void setPrime(boolean prime) {
        isPrime = prime;
    }
}
