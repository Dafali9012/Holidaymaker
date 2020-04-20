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
    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();


    public User customLogin(User user) {
        User dbUser = userRepository.findByEmail(user.getEmail());
        if(dbUser == null) return null;


        if(encoder.matches(user.getPassword(), dbUser.getPassword())) {
            return dbUser;
        }
        return null;
    }

    public User customRegister(User user) {
        User newUser = new User(user.getEmail(), encoder.encode(user.getPassword()));
        return userRepository.save(newUser);
    }
}


