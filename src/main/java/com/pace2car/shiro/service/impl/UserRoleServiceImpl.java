package com.pace2car.shiro.service.impl;

import com.pace2car.shiro.bean.UserRole;
import com.pace2car.shiro.dao.UserRoleMapper;
import com.pace2car.shiro.service.UserRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author Pace2Car
 * @date 2018/12/20 11:55
 */
@Service("userRoleService")
public class UserRoleServiceImpl implements UserRoleService {

    @Resource
    private UserRoleMapper userRoleMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return userRoleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(UserRole record) {
        return userRoleMapper.insertSelective(record);
    }

    @Override
    public UserRole selectByPrimaryKey(Integer id) {
        return userRoleMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByUserIdSelective(UserRole record) {
        return userRoleMapper.updateByUserIdSelective(record);
    }
}
