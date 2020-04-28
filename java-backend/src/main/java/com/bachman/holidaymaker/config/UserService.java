package com.bachman.holidaymaker.config;

import com.bachman.holidaymaker.entity.User;
import com.bachman.holidaymaker.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service

public class UserService {

    @Autowired

    private UserRepository userRepository;

    @Autowired

    private MyUserDetailsService myUserDetailsService;


    public User findCurrentUser() {

        String email = SecurityContextHolder.getContext().getAuthentication().getName();

        return userRepository.findByEmail(email);

    }


    public User registerUser(User user) {

        return myUserDetailsService.addUser(user.getEmail(), user.getPassword());

    }

}


