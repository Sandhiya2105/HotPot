package com.example.demo.repo;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.model.Restaurants;

public interface RestaurantsRepository extends JpaRepository<Restaurants, Integer> {
    List<Restaurants> findByName(String name);
    Restaurants findByNameAndLocation(String name, String location);
}

