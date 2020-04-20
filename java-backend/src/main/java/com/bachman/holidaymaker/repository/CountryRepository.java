package com.bachman.holidaymaker.repository;

import com.bachman.holidaymaker.entity.Country;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CountryRepository extends CrudRepository<Country, Long> {
    List<Country> findAll();
}
