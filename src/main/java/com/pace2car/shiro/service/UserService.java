package com.pace2car.shiro.service;

import com.pace2car.shiro.bean.User;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/6 13:58
 */
public interface UserService {
    /**
     * 验证用户登录信息
     * @param username
     * @return
     */
    User selectByUsername(String username);

    /**
     * 查询用户列表
     * @param record
     * @return
     */
    List<User> selectUsers(User record);

    int deleteByPrimaryKey(Integer id);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

}
