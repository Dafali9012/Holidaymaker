
package com.bachman.holidaymaker.entity;

import javax.persistence.*;

@Entity
public class ReservedRoom {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long bookingNr;
    @Column(name = "room")
    private long room;
    @Column(name = "user")
    private long user;
    @Column(name = "numAdults")
    private int numAdults;
    @Column(name = "numKids")
    private int numKids;
    @Column(name = "checkIn")
    private String checkIn;
    @Column(name = "checkOut")
    private String checkOut;


    public ReservedRoom() {
    }

    public long getBookingNr() {
        return bookingNr;
    }

    public long getRoom() {
        return room;
    }

    public long getUser() {
        return user;
    }

    public int getNumAdults() {
        return numAdults;
    }

    public int getNumKids() {
        return numKids;
    }
}

