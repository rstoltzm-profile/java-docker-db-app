package com.example.repository;

import com.example.entity.EntityClass;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EntityRepository extends JpaRepository<EntityClass, Long> {
}