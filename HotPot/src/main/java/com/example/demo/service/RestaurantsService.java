package com.example.demo.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.model.Restaurants;
import com.example.demo.repo.RestaurantsRepository;
import com.example.demo.exception.ResourceNotFoundException;

@Service
public class RestaurantsService {

    @Autowired
    private RestaurantsRepository repo;

    public String add(Restaurants r) {
        repo.save(r);
        return "Restaurant Added";
    }

    public List<Restaurants> showAll() {
        return repo.findAll();
    }

    public List<Restaurants> showByName(String name) {
        return repo.findByName(name);
    }

    public Restaurants showByNameLocation(String name, String location) {
        Restaurants rest = repo.findByNameAndLocation(name, location);
        if (rest == null) throw new ResourceNotFoundException("Restaurant not found with given name and location");
        return rest;
    }

    public Restaurants showById(int id) {
        return repo.findById(id).orElseThrow(() -> new ResourceNotFoundException("Restaurant ID Not Found"));
    }

    public String delete(int id) {
        repo.deleteById(id);
        return "Deleted";
    }
}

