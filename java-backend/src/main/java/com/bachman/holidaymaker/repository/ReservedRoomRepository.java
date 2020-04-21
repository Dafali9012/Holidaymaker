package com.bachman.holidaymaker.repository;

import com.bachman.holidaymaker.entity.ReservedRoom;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface ReservedRoomRepository extends CrudRepository<ReservedRoom, Long> {

}