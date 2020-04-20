package com.bachman.holidaymaker.entity;

import javax.persistence.*;

@Entity
public class Hotel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long hotelId;
    @Column(name = "City")
    private long cityId;
    @Column(name = "Name")
    private String name;
    @Column(name = "imgLink")
    private String imgLink;
    @Column(name = "Address")
    private String address;
    @Column(name = "phoneNr")
    private String phoneNr;
    @Column(name = "Rating")
    private double rating;
    @Column(name = "HalfBoardPrice")
    private double halfBoardPrice;
    @Column(name = "FullBoardPrice")
    private double fullBoardPrice;
    @Column(name = "AllIncPrice")
    private double allIncPrice;
    @Column(name = "ExtraBedPrice")
    private double extraBedPrice;
    @Column(name = "Pool")
    private int pool;
    @Column(name = "Sauna")
    private int sauna;
    @Column(name = "Bar")
    private int bar;
    @Column(name = "Entertainment")
    private int entertainment;
    @Column(name = "KidsClub")
    private int KidsClub;
    @Column(name = "KmToBeach")
    private double kmToBeach;
    @Column(name = "KmToCenter")
    private double kmToCenter;

    public long getHotelId() {
        return hotelId;
    }

    public long getCityId() {
        return cityId;
    }

    public String getName() {
        return name;
    }

    public String getImgLink() {
        return imgLink;
    }

    public String getAddress() {
        return address;
    }

    public String getPhoneNr() {
        return phoneNr;
    }

    public double getRating() {
        return rating;
    }

    public double getHalfBoardPrice() {
        return halfBoardPrice;
    }

    public double getFullBoardPrice() {
        return fullBoardPrice;
    }

    public double getAllIncPrice() {
        return allIncPrice;
    }

    public double getExtraBedPrice() {
        return extraBedPrice;
    }

    public int getPool() {
        return pool;
    }

    public int getSauna() {
        return sauna;
    }

    public int getBar() {
        return bar;
    }

    public int getEntertainment() {
        return entertainment;
    }

    public int getKidsClub() {
        return KidsClub;
    }

    public double getKmToBeach() {
        return kmToBeach;
    }

    public double getKmToCenter() {
        return kmToCenter;
    }
}
