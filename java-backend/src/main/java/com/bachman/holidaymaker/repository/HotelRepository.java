package com.bachman.holidaymaker.repository;

import com.bachman.holidaymaker.entity.Hotel;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HotelRepository extends CrudRepository<Hotel, Long> {
}
