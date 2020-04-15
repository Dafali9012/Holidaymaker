package com.bachman.holidaymaker.entity;

import com.bachman.holidaymaker.enums.RoomType;

import javax.persistence.*;

@Entity
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public long id;

    @Column
    private String roomNr;
    @Column
    private int hotel;
    @Column
    private String imgLink;
    @Column
    private RoomType roomType;
    @Column
    private boolean smokingAllowed;
    @Column
    private double pricePerNight;

    public Room(){}

    public Room(long id, String roomNr, int hotel, String imgLink,
                RoomType roomType, boolean smokingAllowed, boolean extraBed, double pricePerNight) {
        this.id = id;
        this.roomNr = roomNr;
        this.hotel = hotel;
        this.imgLink = imgLink;
        this.roomType = roomType;
        this.smokingAllowed = smokingAllowed;
        this.pricePerNight = pricePerNight;
    }

    public String getRoomNr() {
        return roomNr;
    }

    public int getHotel() {
        return hotel;
    }

    public RoomType getRoomType() {
        return roomType;
    }

    public String getImgLink() {
        return imgLink;
    }

    public boolean isSmokingAllowed() {
        return smokingAllowed;
    }


    public double getPricePerNight() {
        return pricePerNight;
    }


    }

