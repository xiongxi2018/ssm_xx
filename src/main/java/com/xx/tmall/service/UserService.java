package com.xx.tmall.service;

import com.xx.tmall.pojo.User;

import java.util.List;

public interface UserService {
    List<User> list();
    void addUser(User user);
    void delete(int id);
    User get(int id);
    void update(User user);
}
