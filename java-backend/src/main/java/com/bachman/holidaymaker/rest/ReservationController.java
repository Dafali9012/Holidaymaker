package com.bachman.holidaymaker.rest;

import com.bachman.holidaymaker.entity.Reservation;
import com.bachman.holidaymaker.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;

@RestController
@RequestMapping("/reservation")
public class ReservationController {

        @Autowired
        private ReservationRepository reservationRepository;

        @GetMapping()
        public Iterable<Reservation> getAllReservations() {
            return reservationRepository.findAll();
        }

        @GetMapping("{id}")
        public Iterable<Reservation> reservationById(@PathVariable long id) {
            return this.reservationRepository.findAllById(Collections.singleton(id));
        }
}
