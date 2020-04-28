package com.bachman.holidaymaker.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="roominfo")
public class RoomInformation {

    @Id
    private long roomId;
    private String imgLink;
    private String hotelName;
    private String hotelAddress;
    private String hotelPhone;
    private String countryName;
    private String cityName;
    private String roomType;
    private int hotelRating;
    private int kmToBeach;
    private int kmToCenter;
    private int pricePerNight;

    public RoomInformation() {
    }

    public long getRoomId() {
        return roomId;
    }

    public String getImgLink() {
        return imgLink;
    }

    public String getHotelName() {
        return hotelName;
    }

    public String getHotelAddress() {
        return hotelAddress;
    }

    public String getHotelPhone() {
        return hotelPhone;
    }

    public String getCountryName() {
        return countryName;
    }

    public String getCityName() {
        return cityName;
    }

    public String getRoomType() {
        return roomType;
    }

    public int getHotelRating() {
        return hotelRating;
    }

    public int getKmToBeach() {
        return kmToBeach;
    }

    public int getKmToCenter() {
        return kmToCenter;
    }

    public int getPricePerNight() {
        return pricePerNight;
    }
}
