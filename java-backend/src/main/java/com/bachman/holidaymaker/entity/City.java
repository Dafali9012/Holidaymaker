package com.bachman.holidaymaker.entity;

import javax.persistence.*;

@Entity
public class City {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long cityId;
    @Column(name = "Country")
    private long countryId;
    @Column(name = "Name")
    private String name;

    public City() {
    }

    public long getCityId() {
        return cityId;
    }

    public long getCountryId() {
        return countryId;
    }

    public String getName() {
        return name;
    }
}
