package com.pace2car.shiro.service;

import com.pace2car.shiro.bean.RolePermission;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/20 16:20
 */
public interface RolePermissionService {

    /**
     * 获取角色的权限Id List
     * @param rid
     * @return
     */
    List<RolePermission> selectPermissionsByRid(Integer rid);

    int deleteByRid(Integer rid);

    int insertSelective(RolePermission record);

    RolePermission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RolePermission record);

}
