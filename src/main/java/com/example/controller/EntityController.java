package com.example.controller;

import com.example.entity.EntityClass;
import com.example.repository.EntityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/entities")
public class EntityController {

    @Autowired
    private EntityRepository repository;

    @GetMapping
    public List<EntityClass> getAllEntities() {
        return repository.findAll();
    }
}