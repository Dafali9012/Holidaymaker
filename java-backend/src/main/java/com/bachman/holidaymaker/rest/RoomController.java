package com.bachman.holidaymaker.rest;

import com.bachman.holidaymaker.entity.Room;
import com.bachman.holidaymaker.repository.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/room")
public class RoomController {
    @Autowired
    private RoomRepository roomRepository;

    @GetMapping
    public Iterable<Room> getAllRooms() {
            return roomRepository.findAll();
    }
}
