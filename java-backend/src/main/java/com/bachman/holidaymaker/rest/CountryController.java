package com.bachman.holidaymaker.rest;

import com.bachman.holidaymaker.entity.Country;
import com.bachman.holidaymaker.repository.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;

@RestController
@RequestMapping("/country")
public class CountryController {
    @Autowired
    private CountryRepository countryRepository;

    @GetMapping("all")
    public Iterable<Country> getAllRooms() {
        return countryRepository.findAll();
    }

    @GetMapping("{id}")
    public Iterable<Country> countryById(@PathVariable long id){
        return this.countryRepository.findAllById(Collections.singleton(id));
    }
}
