package com.pace2car.shiro.service;

import com.pace2car.shiro.bean.Role;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/19 17:16
 */
public interface RoleService {

    /**
     * 获取全部角色
     * @return
     */
    List<Role> selectAllRoles();

    /**
     * 获取用户的全部角色
     * @param username
     * @return
     */
    List<String> selectAllRolesByUsername(String username);


    int deleteByPrimaryKey(Integer id);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

}
