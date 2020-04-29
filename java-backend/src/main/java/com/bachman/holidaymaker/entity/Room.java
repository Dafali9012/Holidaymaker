package com.bachman.holidaymaker.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long roomId;
    @Column(name = "RoomNumber")
    private int roomNr;
    @Column(name = "Hotel")
    private long hotelId;
    @Column(name = "imgLink")
    private String imgLink;
    @Column(name = "RoomType")
    private String roomType;
    @Column(name = "SmokingAllowed")
    private String smoking;

    @Column(name = "PricePerNight")
    private String pricePerNight;

    @ManyToMany(mappedBy = "bookedRooms")
    private Set<User> users = new HashSet<>();

    public Room() {
    }

    public Long getRoomId() {
        return roomId;
    }

    public int getRoomNr() {
        return roomNr;
    }

    public long getHotelId() {
        return hotelId;
    }

    public String getImgLink() {
        return imgLink;
    }

    public String getRoomType() {
        return roomType;
    }

    public String getSmoking() {
        return smoking;
    }


    public String getPricePerNight() {
        return pricePerNight;
    }
}
