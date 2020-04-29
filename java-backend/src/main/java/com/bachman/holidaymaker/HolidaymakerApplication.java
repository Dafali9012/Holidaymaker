package com.bachman.holidaymaker;

import com.bachman.holidaymaker.entity.User;
import com.bachman.holidaymaker.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@SpringBootApplication

@RestController
public class HolidaymakerApplication {

    @Autowired
    private UserRepository userRepository;

    @RequestMapping("/name")
    public User user(Principal principal) {
        return userRepository.findByEmail(principal.getName());
    }

    public static void main(String[] args) {

        SpringApplication.run(HolidaymakerApplication.class, args);

    }

}
