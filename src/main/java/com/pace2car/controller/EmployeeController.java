package com.pace2car.controller;

import com.pace2car.bean.Employee;
import com.pace2car.service.EmployeeService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 人事管理
 * @author Pace2Car
 * @date 2018/12/6 17:44
 */
@Controller
@RequestMapping("/employee")
public class EmployeeController {

    static Logger logger = Logger.getLogger(EmployeeController.class);

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/searchEmployee")
    public String searchEmployee(Employee employee, ModelMap modelMap, HttpSession session) {
        List<Employee> employees = null;
        if (employee != null && employee.getEmpNo() != null) {
            logger.info("search employee -> id : " + employee.getEmpNo());
            Employee oldEmployee = employeeService.selectByPrimaryKey(employee.getEmpNo());
            modelMap.addAttribute("oldEmployee", oldEmployee);
            return "updateEmployee";
        }
        employees = employeeService.selectEmployees(employee);
        modelMap.addAttribute("employees", employees);
        session.setAttribute("employee", employee);

        return "employeeList";
    }

    @RequestMapping("/getWorkEmployeeList")
    public String getWorkEmployeeList(Employee employee, ModelMap modelMap, HttpSession session) {
        List<Employee> employees = null;
        employees = employeeService.selectEmployees(employee);
        modelMap.addAttribute("employees", employees);
        session.setAttribute("employee", employee);

        return "workEmployeeList";
    }

    @RequestMapping("/insertEmployee")
    public void insertEmployee(Employee employee, HttpServletResponse response) {
        logger.info("insert employee -> name : " + employee.getEmpName());
        try {
            if (employeeService.insertSelective(employee) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/deleteEmployee")
    public void deleteEmployee(Employee employee, HttpServletResponse response) {
        logger.info("delete employee -> name : " + employee.getEmpNo());
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        employee.setDepartureTime(df.format(new Date()));
        try {
            if (employeeService.deleteByPrimaryKey(employee) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/updateEmployee")
    public void updateEmployee(Employee employee, HttpServletResponse response) {
        logger.info("update employee -> name : " + employee.getEmpName());
        try {
            if (employeeService.updateByPrimaryKeySelective(employee) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
