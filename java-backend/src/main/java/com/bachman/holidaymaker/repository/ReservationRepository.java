package com.bachman.holidaymaker.repository;

import com.bachman.holidaymaker.entity.Reservation;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface ReservationRepository extends CrudRepository<Reservation, Long> {
}
