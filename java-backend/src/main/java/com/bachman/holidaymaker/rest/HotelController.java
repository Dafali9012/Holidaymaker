package com.bachman.holidaymaker.rest;


import com.bachman.holidaymaker.entity.Hotel;
import com.bachman.holidaymaker.repository.HotelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;

@RestController
@RequestMapping("/hotel")
public class HotelController {

    @Autowired
    private HotelRepository hotelRepository;

    @GetMapping()
    public Iterable<Hotel> getAllHotels() {
        return hotelRepository.findAll();
    }

    @GetMapping("{id}")
    public Iterable<Hotel> hotelById(@PathVariable long id) {
        return this.hotelRepository.findAllById(Collections.singleton(id));
    }
}
