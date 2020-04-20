package com.bachman.holidaymaker.rest;

import com.bachman.holidaymaker.entity.City;
import com.bachman.holidaymaker.repository.CityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;

@RestController
@RequestMapping("/city")
public class CityController {
    @Autowired
    private CityRepository cityRepository;

    @GetMapping()
    public Iterable<City> getAllCities() {
        return cityRepository.findAll();
    }

    @GetMapping("{id}")
    public Iterable<City> countryById(@PathVariable long id) {
        return this.cityRepository.findAllById(Collections.singleton(id));
    }
}
