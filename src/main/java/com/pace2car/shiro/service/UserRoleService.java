package com.pace2car.shiro.service;

import com.pace2car.shiro.bean.UserRole;

/**
 * @author Pace2Car
 * @date 2018/12/20 11:53
 */
public interface UserRoleService {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(Integer id);

    int updateByUserIdSelective(UserRole record);
}
