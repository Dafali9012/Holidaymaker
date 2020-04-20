package com.bachman.holidaymaker.entity;

import javax.persistence.*;

@Entity
public class Reservation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long bookingNumber;
    @Column(name = "NumberOfRooms")
    private int numberOfRooms;
    @Column(name = "UserId")
    private long userId;
    @Column(name = "CheckIn")
    private String CheckIn;
    @Column(name = "CheckOut")
    private String checkOut;
    @Column(name = "totalPrice")
    private double totalPrice;

    public long getBookingNumber() {
        return bookingNumber;
    }

    public int getNumberOfRooms() {
        return numberOfRooms;
    }

    public long getUserId() {
        return userId;
    }

    public String getCheckIn() {
        return CheckIn;
    }

    public String getCheckOut() {
        return checkOut;
    }

    public double getTotalPrice() {
        return totalPrice;
    }
}
