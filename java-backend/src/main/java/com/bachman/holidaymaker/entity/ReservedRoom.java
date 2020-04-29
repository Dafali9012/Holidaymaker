
package com.bachman.holidaymaker.entity;

import com.bachman.holidaymaker.enums.BoardType;

import javax.persistence.*;
import java.util.Date;

@Entity
public class ReservedRoom {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long bookingNr;
    @OneToOne
    @JoinColumn(name="room", nullable=false)
    private Room room;
    @OneToOne
    @JoinColumn(name="user", nullable=false)
    private User user;
    @Column(name = "numAdults")
    private int numAdults;
    @Column(name = "numKids")
    private int numKids;
    @Column(name = "numSmallKids")
    private int numSmallKids;
    @Column(name = "checkIn")
    private Date checkIn;
    @Column(name = "checkOut")
    private Date checkOut;
    @Column(name = "board")
    private BoardType board;
    @Column(name = "extraBed")
    private int extraBed;
    @Column(name = "totalRoomPrice")
    private int totalRoomPrice;

    public ReservedRoom() {
    }

    public ReservedRoom(Room roomId, User userid, int numAdults, int numKids, int numSmallKids, Date checkin,
                        Date checkout, BoardType boardType, int extraBed, int totalRoomPrice){
        this.user = userid;
        this.room = roomId;
        this.numAdults = numAdults;
        this.numKids = numKids;
        this.numSmallKids = numSmallKids;
        this.checkIn = checkin;
        this.checkOut = checkout;
        this.board = boardType;
        this.extraBed = extraBed;
        this.totalRoomPrice = totalRoomPrice;
    }

    public Date getCheckIn() {
        return checkIn;
    }

    public Date getCheckOut() { return checkOut; }

    public BoardType getBoard() { return board; }

    public int getExtraBed() {
        return extraBed;
    }

    public int getTotalRoomPrice() {
        return totalRoomPrice;
    }

    public long getBookingNr() {
        return bookingNr;
    }

    public Room getRoom() {
        return room;
    }

    public User getUser() {
        return user;
    }

    public int getNumAdults() {
        return numAdults;
    }

    public int getNumKids() {
        return numKids;
    }

    public int getNumSmallKids() { return numSmallKids; }
}

