package com.pace2car.shiro.dao;

import com.pace2car.shiro.bean.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    /**
     * 验证用户登录信息
     * @param username
     * @return
     */
    User selectByUsername(String username);

    /**
     * 查询用户列表
     * @param user
     * @return
     */
    List<User> selectUsers(User record);

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}