package com.pace2car.shiro.dao;

import com.pace2car.shiro.bean.RolePermission;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RolePermissionMapper {

    /**
     * 获取角色的权限Id List
     * @param rid
     * @return
     */
    List<RolePermission> selectPermissionsByRid(Integer rid);

    int deleteByRid(Integer rid);

    int insert(RolePermission record);

    int insertSelective(RolePermission record);

    RolePermission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RolePermission record);

    int updateByPrimaryKey(RolePermission record);
}