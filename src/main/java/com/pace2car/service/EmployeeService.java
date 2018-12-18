package com.pace2car.service;

import com.pace2car.bean.Employee;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/6 17:41
 */
public interface EmployeeService {
    /**
     * 查询employee列表
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

    /**
     * 新增员工并返回主键
     * @param record
     * @return
     */
    int insertSelective(Employee record);

    /**
     * 根据员工编号查员工
     * @param empNo
     * @return
     */
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

    /**
     * 根据员工编号删除员工
     * @param employee
     * @return
     */
    int deleteByPrimaryKey(Employee employee);

    /**
     * 更新员工信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Employee record);
}
