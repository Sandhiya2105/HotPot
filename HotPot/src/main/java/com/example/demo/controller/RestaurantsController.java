package com.example.demo.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.example.demo.model.Restaurants;
import com.example.demo.service.RestaurantsService;

@RestController
public class RestaurantsController {

    @Autowired
    private RestaurantsService service;

    @PostMapping("/addRestaurant")
    public String add(@RequestBody Restaurants r) {
        return service.add(r);
    }

    @GetMapping("/showRestaurants")
    public List<Restaurants> showAll() {
        return service.showAll();
    }

    @GetMapping("/restaurantByName/{name}")
    public List<Restaurants> showByName(@PathVariable String name) {
        return service.showByName(name);
    }

    @GetMapping("/restaurantByNameLocation/{name}/{location}")
    public Restaurants showByNameLoc(@PathVariable String name, @PathVariable String location) {
        return service.showByNameLocation(name, location);
    }

    @GetMapping("/restaurantById/{id}")
    public Restaurants showById(@PathVariable int id) {
        return service.showById(id);
    }

    @DeleteMapping("/deleteRestaurant/{id}")
    public String delete(@PathVariable int id) {
        return service.delete(id);
    }
}

