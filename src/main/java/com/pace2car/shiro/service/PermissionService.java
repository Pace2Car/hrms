package com.pace2car.shiro.service;

import com.pace2car.shiro.bean.Permission;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/19 16:40
 */
public interface PermissionService {

    /**
     * 获取全部资源
     * @return
     */
    List<Permission> selectAllPermissions();

    /**
     * 获取全部资源
     * @return
     */
    List<String> selectAllResources();

    /**
     * 获取用户可访问的全部资源
     * @return
     */
    List<String> selectAllResourcesByUsername(String username);

    int insertSelective(Permission record);

}
