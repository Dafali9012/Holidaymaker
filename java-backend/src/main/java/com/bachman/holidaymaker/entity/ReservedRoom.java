//package com.bachman.holidaymaker.entity;
//
//import com.bachman.holidaymaker.enums.BoardType;
//
//import javax.persistence.*;
//import java.util.Date;
//
//@Entity
//public class ReservedRoom {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column
<<<<<<< Updated upstream
//    private long id;
=======
//    public long id;
>>>>>>> Stashed changes
//
//    @Column
//    private int numberOfAdults;
//    @Column
//    private int numberOfChildren;
//    @Column
//    private Date checkin;
//    @Column
//    private Date checkout;
//    @Column
//    private BoardType board;
//    @Column
//    private boolean extraBed;
//    @Column
//    private double totalRoomPrice;
//
//
<<<<<<< Updated upstream
//    @ManyToMany (fetch = FetchType.LAZY)
//    @JoinColumn(name = "id")
=======
//    @ManyToMany (fetch = FetchType.LAZY, optional = false)
//    @JoinColumn
>>>>>>> Stashed changes
//    private Room room;
//    @JoinColumn(name = "id")
//    private User user;
//
//
//    public ReservedRoom() {
//    }
//
//    public ReservedRoom(Room room, User user, int numAdults, int numChildren, Date checkin, Date checkout, BoardType boardType,
//                        boolean exBed, double totalRoomPrice){
//        this.room = room;
//        this.user = user;
//        this.numberOfAdults = numAdults;
//        this.numberOfChildren = numChildren;
//        this.checkin = checkin;
//        this.checkout = checkout;
//        this.board = boardType;
//        this.extraBed = exBed; //tinyint; if 0 el 1?
//        this.totalRoomPrice = totalRoomPrice; //calculate?
//
//    }
//
//    public long getId() {
//        return id;
//    }
//
//    public void setId(long id) {
//        this.id = id;
//    }
//
//    public Room getRoom() {
//        return room;
//    }
//
//    public void setRoom(Room room) { this.room = room;}
//
//    public User getUser() {
//        return user;
//    }
//
//    public void setUser(User user) {
//        this.user = user;
//    }
//
//    public int getNumberOfAdults() {
//        return numberOfAdults;
//    }
//
//    public void setNumberOfAdults(int numberOfAdults) {
//        this.numberOfAdults = numberOfAdults;
//    }
//
//    public int getNumberOfChildren() {
//        return numberOfChildren;
//    }
//
//    public void setNumberOfChildren(int numberOfChildren) {
//        this.numberOfChildren = numberOfChildren;
//    }
//
//    public Date getCheckin() {
//        return checkin;
//    }
//
//    public void setCheckin(Date checkin) {
//        this.checkin = checkin; }
//
//    public Date getCheckout() {
//        return checkout;
//    }
//
//    public void setCheckout(Date checkout) {
//        this.checkout = checkout;
//    }
//
//    public BoardType getBoard() {
//        return board;
//    }
//
//    public void setBoard(BoardType board) {
//        this.board = board;
//    }
//
//    public boolean isExtraBed() {
//        return extraBed;
//    }
//
//    public void setExtraBed(boolean extraBed) {
//        this.extraBed = extraBed;
//    }
//
//    public double getTotalRoomPrice() {
//        return totalRoomPrice;
//    }
//
//    public void setTotalRoomPrice(double totalRoomPrice) {
//        this.totalRoomPrice = totalRoomPrice;
//    }
//}
