package com.bachman.holidaymaker.rest;

import com.bachman.holidaymaker.entity.RoomInformation;
import com.bachman.holidaymaker.repository.RoomInformationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/roominfo")
public class RoomInformationController {
    @Autowired
    private RoomInformationRepository roomInformationRepository;

    @GetMapping
    public Iterable<RoomInformation> getAllRoomInformation() {
        return roomInformationRepository.findAll();
    }
}
