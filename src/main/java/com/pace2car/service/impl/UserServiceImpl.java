package com.pace2car.service.impl;

import com.pace2car.shiro.bean.User;
import com.pace2car.shiro.dao.UserMapper;
import com.pace2car.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/6 14:08
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    static Logger logger = Logger.getLogger(UserServiceImpl.class);

    @Resource
    private UserMapper userMapper;

    @Override
    public User selectByLogin(User logUser) {
        return userMapper.selectByLogin(logUser);
    }

    @Override
    public List<User> selectUsers(User record) {
        return userMapper.selectUsers(record);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(User record) {
        return userMapper.insertSelective(record);
    }

    @Override
    public User selectByPrimaryKey(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(User record) {
        return userMapper.updateByPrimaryKeySelective(record);
    }
}
