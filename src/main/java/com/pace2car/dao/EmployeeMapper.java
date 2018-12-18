package com.pace2car.dao;

import com.pace2car.bean.Employee;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeMapper {

    /**
     * 获取员工信息列表
     * @param employee
     * @return
     */
    List<Employee> selectEmployees(Employee employee);

    /**
     * 获取员工职位信息列表
     * @param employee
     * @return
     */
    List<Employee> selectEmpPosition(Employee employee);

    int deleteByPrimaryKey(Employee employee);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Integer empNo);

    /**
     * 根据员工编号查询职位
     * @param empNo
     * @return
     */
    Employee selectPosByPrimaryKey(Integer empNo);

    /**
     * 根据员工编号查询工资详情
     * @param empNo
     * @return
     */
    Employee selectSalByPrimaryKey(Integer empNo);

    /**
     * 根据部门编号查询工资详情表
     * @param employee
     * @return
     */
    List<Employee> selectSalByDeptNo(Employee employee);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
}