package com.bachman.holidaymaker.repository;

import com.bachman.holidaymaker.entity.Room;
import com.bachman.holidaymaker.enums.RoomType;
import org.springframework.data.repository.CrudRepository;

import java.util.Date;
import java.util.List;

public interface RoomRepository extends CrudRepository<Room, Long> {

//TODO specificiera exakt vilka sökningar vi ska använda oss av
    List<Room> findAll();
    List<Room> findAllByCountry(String country);
    List<Room> findAvailableRooms(Date checkin, Date checkout, String City, RoomType roomtype);
    List<Room> findAvailableRoomsWithDistance(Date checkin, Date checkout, String City, RoomType roomtype,
                                              double distanceToBeach, double distanceToCenter);


}
