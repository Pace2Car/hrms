package com.pace2car.shiro.service.impl;

import com.pace2car.shiro.bean.Permission;
import com.pace2car.shiro.dao.PermissionMapper;
import com.pace2car.shiro.service.PermissionService;
import com.pace2car.shiro.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/19 16:40
 */
@Service("permissionServiceImpl")
public class PermissionServiceImpl implements PermissionService {

    @Resource
    private PermissionMapper permissionMapper;

    @Resource
    private RoleService roleService;

    @Override
    public List<Permission> selectAllPermissions() {
        return permissionMapper.selectAllPermissions();
    }

    @Override
    public List<String> selectAllResources() {
        return permissionMapper.selectAllResources();
    }

    @Override
    public List<String> selectAllResourcesByUsername(String username) {
        List<String> resourceList = new ArrayList<>();
        List<String> roleList = roleService.selectAllRolesByUsername(username);
        for (String roleShortName : roleList) {
            List<String> resources = permissionMapper.selectAllResourcesByRole(roleShortName);
            for (String resource : resources) {
                if (resourceList.contains(resource)) {
                    continue;
                }
                resourceList.add(resource);
            }
        }
        return resourceList;
    }

    @Override
    public int insertSelective(Permission record) {
        return permissionMapper.insertSelective(record);
    }

}
