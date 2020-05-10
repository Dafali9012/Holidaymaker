package com.bachman.holidaymaker.repository;

import com.bachman.holidaymaker.entity.RoomInformation;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomInformationRepository extends CrudRepository<RoomInformation, Long> {
}
