package com.pace2car.service;

import com.pace2car.bean.Department;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/7 9:11
 */
public interface DepartmentService {
    /**
     * 查询department列表
     * @param department
     * @return
     */
    List<Department> selectDepartments(Department department);

    /**
     * 新增部门并返回主键
     * @param record
     * @return
     */
    int insertSelective(Department record);

    /**
     * 根据部门编号查部门
     * @param deptNo
     * @return
     */
    Department selectByPrimaryKey(Integer deptNo);

    /**
     * 根据部门编号删除部门
     * @param deptNo
     * @return
     */
    int deleteByPrimaryKey(Integer deptNo);

    /**
     * 更新部门信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Department record);
}
