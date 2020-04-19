package com.bachman.holidaymaker.rest;

import com.bachman.holidaymaker.entity.Country;
import com.bachman.holidaymaker.repository.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/country")
public class CountryController {

    @Autowired
    private CountryRepository countryRep;

    @GetMapping
    public Iterable<Country> loadAllCountries(){
        System.out.println(countryRep);
        return countryRep.findAll();
    }

}
