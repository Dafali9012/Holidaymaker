package com.bachman.holidaymaker.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long userId;
    private String name;
    private String email;
    private String password;
    private String address;
    private String phoneNumber;

    public User() {
        this.name = "Undefined";
        this.address = "Undefined";
        this.phoneNumber = "Undefined";
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
        this.name = "Undefined";
        this.address = "Undefined";
        this.phoneNumber = "Undefined";
    }

    public long getUserId() {
        return userId;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getAddress() {
        return address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }
}
