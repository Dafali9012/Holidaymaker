package com.bachman.holidaymaker.rest;

import com.bachman.holidaymaker.entity.Reservation;
import com.bachman.holidaymaker.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
        @DeleteMapping("{id}")
        public void deleteReservationById(@PathVariable long id) {
            reservationRepository.deleteById(id);
        }
}
