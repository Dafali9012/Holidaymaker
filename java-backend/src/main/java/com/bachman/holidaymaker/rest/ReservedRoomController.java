package com.bachman.holidaymaker.rest;

import com.bachman.holidaymaker.entity.ReservedRoom;
import com.bachman.holidaymaker.entity.User;
import com.bachman.holidaymaker.repository.ReservedRoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;

@RestController
@RequestMapping("/reservedroom")
public class ReservedRoomController {
    @Autowired
    private ReservedRoomRepository reservedRoomRep;

    @GetMapping()
    public Iterable<ReservedRoom> getAllReservedRooms() {
        return reservedRoomRep.findAll();
    }

    @GetMapping("{id}")
    public Iterable<ReservedRoom> reservedRoomById(@PathVariable long id){
        return this.reservedRoomRep.findAllById(Collections.singleton(id));
    }

    @PostMapping
    public ReservedRoom addReservedRoom(@RequestBody ReservedRoom rr) {
        return reservedRoomRep.save(rr);
    }
}
