package com.bachman.holidaymaker.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long userId;
    @Column(name = "FullName")
    private String name;
    @Column(name = "Email")
    private String email;
    @Column(name = "Password")
    private String password;
    @Column(name = "Address")
    private String address;
    @Column(name = "PhoneNumber")
    private String phonenumber;


    public User(String username, String password) {
        this.name = username;
        this.password = password;
        this.address = "-";
        this.phonenumber = "-";
        this.email = "-";
    }
    public User() {
        this.email = "-";
        this.password = "-";
        this.name = "-";
        this.address = "-";
        this.phonenumber = "-";
    }

    @JsonProperty
    public void setPassword(String password) {
        this.password = password;
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

    @JsonIgnore
    public String getPassword() {
        return password;
    }

    public String getAddress() {
        return address;
    }

    public String getPhonenumber() {
        return phonenumber;
    }
}
