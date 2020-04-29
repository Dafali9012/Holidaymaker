package com.bachman.holidaymaker.rest;

import com.bachman.holidaymaker.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
public class SecurityController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/name")
    public Long user(Principal principal) {
        return userRepository.findByEmail(principal.getName()).getUserId();
    }
}