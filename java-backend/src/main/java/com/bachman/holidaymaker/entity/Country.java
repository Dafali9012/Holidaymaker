package com.bachman.holidaymaker.entity;

import javax.persistence.*;

@Entity
public class Country {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column
    private String name;

    public Country() {
    }

    public String getName() {
        return name;
    }

}
