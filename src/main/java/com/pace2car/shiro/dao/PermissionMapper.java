package com.pace2car.shiro.dao;

import com.pace2car.shiro.bean.Permission;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PermissionMapper {

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
     * 获取全部资源
     * @param shortName
     * @return
     */
    List<String> selectAllResourcesByRole(String shortName);

    int deleteByPrimaryKey(Integer id);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);
}