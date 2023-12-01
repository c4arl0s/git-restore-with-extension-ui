package com.tdd.domain.service;

import com.tdd.domain.model.Cart;
import com.tdd.domain.model.Customer;
import io.micronaut.test.extensions.junit5.annotation.MicronautTest;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

@MicronautTest
class ShippingServiceTest {

    private ShippingService shippingService;
    private Cart shoppingCart;

    private Customer primeCustomer;
    private Customer regularCustomer;

    @BeforeEach
    void setup() {
        shippingService = new ShippingService();
        shoppingCart = new Cart();

        primeCustomer = new Customer(true);
        regularCustomer = new Customer(false);
    }

    @Test
    void calculateShipping() {
        shippingService.calculateShipping(shoppingCart, primeCustomer);
    }

}