package com.bachman.holidaymaker.repository;

import com.bachman.holidaymaker.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    User findByName(String name);
    User findByEmail(String email);
    List<User> findAllByName(String name);
    List<User> findAll();

}
