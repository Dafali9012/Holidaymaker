package com.bachman.holidaymaker.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.bachman.holidaymaker.entity.City;

@Repository
public interface CityRepository extends CrudRepository<City, Long> {
}
