package com.bachman.holidaymaker.rest;

import com.bachman.holidaymaker.entity.Room;
import com.bachman.holidaymaker.enums.RoomType;
import com.bachman.holidaymaker.repository.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import java.util.Date;

@RestController
@RequestMapping("rest/search")
public class RoomController {

    @Autowired
    private RoomRepository roomRep;

    @GetMapping
    public Iterable<Room> getAllRooms() {
        return roomRep.findAll();
    }

    @GetMapping
    public Iterable<Room> getAllRoomsInCountry(String country) {
        return roomRep.findAllByCountry(country);
    }

    @GetMapping
    public void getRoomInCity(@PathVariable Date checkin, Date checkout, String city, RoomType rp ) {
        roomRep.findAvailableRooms(checkin, checkout, city, rp);
    }

    @GetMapping
    public Iterable<Room> get(@RequestParam(required = false) Date checkin, Date checkout, String city, RoomType roomtype,
                              double distanceToBeach, double distanceToCenter) {

        return roomRep.findAvailableRoomsWithDistance(checkin, checkout, city, roomtype,
                distanceToBeach, distanceToCenter);
    }
    
}
