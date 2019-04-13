package com.sgh.controller;

import com.sgh.entity.User;
import com.sgh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController()
@RequestMapping("user")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("showAll")
    public Map showAll(int page, int rows, User user) {
        return userService.selectAllUsers(page, rows, user);
    }
}
