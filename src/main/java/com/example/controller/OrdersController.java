package com.example.controller;

import com.example.entity.Orders; // Add this import
import com.example.repository.OrdersRepository; // Add this import
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/orders")
public class OrdersController {

    @Autowired
    private OrdersRepository ordersRepository;

    @GetMapping
    public List<Orders> getAllOrders() {
        return ordersRepository.findAll();
    }

    @PostMapping
    public Orders createOrders(@RequestBody Orders orders) {
        return ordersRepository.save(orders);
    }
}