package com.pace2car.service.impl;

import com.pace2car.bean.Employee;
import com.pace2car.controller.SystemController;
import com.pace2car.dao.EmployeeMapper;
import com.pace2car.service.EmployeeService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/6 17:45
 */
@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

    @Resource
    private EmployeeMapper employeeMapper;

    @Override
    public List<Employee> selectEmployees(Employee employee) {
        return employeeMapper.selectEmployees(employee);
    }

    @Override
    public List<Employee> selectEmpPosition(Employee employee) {
        return employeeMapper.selectEmpPosition(employee);
    }

    @Override
    public int insertSelective(Employee record) {
        return employeeMapper.insertSelective(record);
    }

    @Override
    public Employee selectByPrimaryKey(Integer empNo) {
        return employeeMapper.selectByPrimaryKey(empNo);
    }

    @Override
    public Employee selectPosByPrimaryKey(Integer empNo) {
        return employeeMapper.selectPosByPrimaryKey(empNo);
    }

    @Override
    public Employee selectSalByPrimaryKey(Integer empNo) {
        return employeeMapper.selectSalByPrimaryKey(empNo);
    }

    @Override
    public List<Employee> selectSalByDeptNo(Employee employee) {
        return employeeMapper.selectSalByDeptNo(employee);
    }

    @Override
    public int deleteByPrimaryKey(Employee employee) {
        return employeeMapper.deleteByPrimaryKey(employee);
    }

    @Override
    public int updateByPrimaryKeySelective(Employee record) {
        return employeeMapper.updateByPrimaryKeySelective(record);
    }
}
