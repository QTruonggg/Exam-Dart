package com.example.apidart.service;

import com.example.apidart.entity.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> getAllCustomers();
    Customer addCustomer(Customer customer);
}
