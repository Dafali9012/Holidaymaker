package com.bachman.holidaymaker.rest;

import com.bachman.holidaymaker.entity.User;
import com.bachman.holidaymaker.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@RequestMapping("/")
public class SecurityController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/login/name")
    public User user(Principal principal) {
        User u = userRepository.findByEmail(principal.getName());
        System.out.println(u);
        return u;
    }
}