package com.pace2car.service.impl;

import com.pace2car.bean.Department;
import com.pace2car.dao.DepartmentMapper;
import com.pace2car.service.DepartmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/7 9:14
 */
@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {

    @Resource
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> selectDepartments(Department department) {
        return departmentMapper.selectDepartments(department);
    }

    @Override
    public int insertSelective(Department record) {
        return departmentMapper.insertSelective(record);
    }

    @Override
    public Department selectByPrimaryKey(Integer deptNo) {
        return departmentMapper.selectByPrimaryKey(deptNo);
    }

    @Override
    public int deleteByPrimaryKey(Integer deptNo) {
        return departmentMapper.deleteByPrimaryKey(deptNo);
    }

    @Override
    public int updateByPrimaryKeySelective(Department record) {
        return departmentMapper.updateByPrimaryKeySelective(record);
    }
}
