package com.pace2car.shiro.service.impl;

import com.pace2car.shiro.bean.RolePermission;
import com.pace2car.shiro.dao.RolePermissionMapper;
import com.pace2car.shiro.service.RolePermissionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/20 16:20
 */
@Service("rolePermissionService")
public class RolePermissionServiceImpl implements RolePermissionService {

    @Resource
    private RolePermissionMapper rolePermissionMapper;

    @Override
    public List<RolePermission> selectPermissionsByRid(Integer rid) {
        return rolePermissionMapper.selectPermissionsByRid(rid);
    }

    @Override
    public int deleteByRid(Integer rid) {
        return rolePermissionMapper.deleteByRid(rid);
    }

    @Override
    public int insertSelective(RolePermission record) {
        return rolePermissionMapper.insertSelective(record);
    }

    @Override
    public RolePermission selectByPrimaryKey(Integer id) {
        return rolePermissionMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(RolePermission record) {
        return rolePermissionMapper.updateByPrimaryKeySelective(record);
    }
}
