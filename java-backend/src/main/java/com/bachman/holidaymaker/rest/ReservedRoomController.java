package com.bachman.holidaymaker.rest;

import com.bachman.holidaymaker.entity.ReservedRoom;
import com.bachman.holidaymaker.repository.ReservedRoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;

@RestController
@RequestMapping("/reservedroom")
public class ReservedRoomController {
    @Autowired
    private ReservedRoomRepository reservedRoomRepository;

    @GetMapping()
    public Iterable<ReservedRoom> getAllRooms() {
        return reservedRoomRepository.findAll();
    }

    @GetMapping("{id}")
    public Iterable<ReservedRoom> roomById(@PathVariable long id){
        return this.reservedRoomRepository.findAllById(Collections.singleton(id));
    }
}
