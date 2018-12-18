package com.pace2car.dao;

import com.pace2car.bean.Department;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentMapper {

    /**
     * 获取部门列表
     * @param department
     * @return
     */
    List<Department> selectDepartments(Department department);

    int deleteByPrimaryKey(Integer deptNo);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer deptNo);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
}