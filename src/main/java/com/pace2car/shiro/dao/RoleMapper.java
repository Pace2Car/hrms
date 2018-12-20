package com.pace2car.shiro.dao;

import com.pace2car.shiro.bean.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleMapper {

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

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
}