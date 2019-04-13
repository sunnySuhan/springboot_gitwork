package com.sgh.service;


import com.sgh.entity.User;

import java.util.Map;

public interface UserService {
    Map selectAllUsers(int page, int rows, User user);
}
