package com.pace2car.shiro.service.impl;

import com.pace2car.shiro.bean.Role;
import com.pace2car.shiro.dao.RoleMapper;
import com.pace2car.shiro.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/19 17:25
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleMapper roleMapper;

    @Override
    public List<Role> selectAllRoles() {
        return roleMapper.selectAllRoles();
    }

    @Override
    public List<String> selectAllRolesByUsername(String username) {
        return roleMapper.selectAllRolesByUsername(username);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(Role record) {
        return roleMapper.insertSelective(record);
    }

    @Override
    public Role selectByPrimaryKey(Integer id) {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Role record) {
        return roleMapper.updateByPrimaryKeySelective(record);
    }
}
