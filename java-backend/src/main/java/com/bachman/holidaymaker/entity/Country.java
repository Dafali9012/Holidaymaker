package com.bachman.holidaymaker.entity;

import javax.persistence.*;

@Entity
public class Country {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long countryId;
    @Column(name = "Name")

    private String name;

    public Country() {
    }

    public long getCountryId() {
        return countryId;
    }

    public String getName() {
        return name;
    }
}

