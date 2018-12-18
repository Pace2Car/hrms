package com.pace2car.controller;

import com.pace2car.bean.Department;
import com.pace2car.service.DepartmentService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 部门管理
 * @author Pace2Car
 * @date 2018/12/7 9:10
 */
@Controller
@RequestMapping("/department")
public class DepartmentController {

    static Logger logger = Logger.getLogger(DepartmentController.class);

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping(value = {"/load_depts"}, method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public List<Department> loadDepts() {
        return departmentService.selectDepartments(null);
    }

    @RequestMapping("/searchDepartment")
    public String searchEmployee(Department department, ModelMap modelMap, HttpSession session) {
        List<Department> departments = null;
        if (department != null && department.getDeptNo() != null) {
            logger.info("searchDepartment" + department.getDeptNo());
            Department oldDepartment = departmentService.selectByPrimaryKey(department.getDeptNo());
            modelMap.addAttribute("oldDepartment", oldDepartment);
            return "updateDepartment";
        }
        departments = departmentService.selectDepartments(department);
        modelMap.addAttribute("departments", departments);
        session.setAttribute("department", department);

        return "departmentList";
    }

    @RequestMapping("/insertDepartment")
    public void insertEmployee(Department department, HttpServletResponse response) {
        logger.info("insert department -> name : " + department.getDeptName());
        try {
            if (departmentService.insertSelective(department) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.warn("insert department fail -> name : " + department.getDeptName());
            e.printStackTrace();
        }
    }

    @RequestMapping("/deleteDepartment")
    public void deleteEmployee(Department department, HttpServletResponse response) {
        logger.info("delete department -> name : " + department.getDeptNo());
        try {
            if (departmentService.deleteByPrimaryKey(department.getDeptNo()) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/updateDepartment")
    public void updateEmployee(Department department, HttpServletResponse response) {
        logger.info("update department -> name : " + department.getDeptName());
        try {
            if (departmentService.updateByPrimaryKeySelective(department) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.info("update department fail -> name : " + department.getDeptName());
            e.printStackTrace();
        }
    }
}
