package com.sgh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sgh.dao.UserDao;
import com.sgh.entity.User;
import com.sgh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public Map selectAllUsers(int page, int rows, User user) {
        Map map = new HashMap();
        if (user != null && user.getName() != null) user.setName("%" + user.getName() + "% ");
        PageHelper.startPage(page, rows);
        PageInfo<User> userPageInfo = new PageInfo<>(userDao.select(user));
        map.put("rows", userPageInfo.getList());
        map.put("total", userPageInfo.getTotal());
        return map;
    }
}
