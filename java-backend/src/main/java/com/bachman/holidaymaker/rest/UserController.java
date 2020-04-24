package com.bachman.holidaymaker.rest;


import com.bachman.holidaymaker.config.MyUserDetailsService;
import com.bachman.holidaymaker.entity.User;
import com.bachman.holidaymaker.repository.UserRepository;
import org.apache.catalina.Authenticator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;


@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserRepository userRepository;
    private Authenticator authManager;

    @Autowired
    private MyUserDetailsService myUserDetailsService;

    @PostMapping("/register")
    public User addUser(@RequestBody User user) {
        user.setPassword(myUserDetailsService.getEncoder().encode(user.getPassword()));
        return userRepository.save(user);
    }

    @GetMapping("all")
    public List<User> users(){
        return (List<User>) this.userRepository.findAll();
    }

    @GetMapping("{id}")
    public Iterable<User> userById(@PathVariable long id){
        return this.userRepository.findAllById(Collections.singleton(id));
    }

    }


