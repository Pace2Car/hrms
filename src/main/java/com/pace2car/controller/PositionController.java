package com.pace2car.controller;

import com.pace2car.bean.Employee;
import com.pace2car.bean.Position;
import com.pace2car.service.EmployeeService;
import com.pace2car.service.PositionService;
import com.pace2car.shiro.anno.PermissionName;
import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
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
 * 职位管理
 * @author Pace2Car
 * @date 2018/12/10 10:48
 */
@Controller
@RequestMapping("/position")
public class PositionController {

    static Logger logger = Logger.getLogger(PositionController.class);

    @Autowired
    private PositionService positionService;

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = {"/load_posis"}, method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public List<Position> loadPosis() {
        return positionService.selectPositions(null);
    }

    @RequestMapping("/searchEmpPosition")
    @RequiresPermissions("employee:select")
    @PermissionName("查询员工")
    public String searchEmpPosition(Employee employee, ModelMap modelMap, HttpSession session) {
        List<Employee> employees = null;
        if (employee != null && employee.getEmpNo() != null) {
            logger.info("searchEmpPosition" + employee.getEmpNo());
            Employee oldEmployee = employeeService.selectPosByPrimaryKey(employee.getEmpNo());
            modelMap.addAttribute("oldEmployee", oldEmployee);
            return "updateEmpPosition";
        }
        employees = employeeService.selectEmpPosition(employee);
        modelMap.addAttribute("employees", employees);
        session.setAttribute("employee", employee);

        return "empPositionList";
    }

    @RequestMapping("/getPositionList")
    @RequiresPermissions("position:select")
    @PermissionName("查询职位")
    public String getPositionList(Position position, ModelMap modelMap, HttpSession session) {
        List<Position> positions = null;
        if (position != null && position.getId() != null) {
            logger.info("getPositionList" + position.getId());
            Position oldPosition = positionService.selectByPrimaryKey(position.getId());
            modelMap.addAttribute("oldPosition", oldPosition);
            return "updatePosition";
        }
        positions = positionService.selectPositions(position);
        modelMap.addAttribute("positions", positions);
        session.setAttribute("position", position);

        return "positionList";
    }

    @RequestMapping("/insertPosition")
    @RequiresPermissions("position:insert")
    @PermissionName("新增职位")
    public void insertPosition(Position position, HttpServletResponse response) {
        logger.info("insert position -> name : " + position.getPosName());
        try {
            if (positionService.insertSelective(position) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.info("insert position fail -> name : " + position.getPosName());
            e.printStackTrace();
        }
    }

    @RequestMapping("/deletePosition")
    @RequiresPermissions("position:delete")
    @PermissionName("删除职位")
    public void deletePosition(Position position, HttpServletResponse response) {
        logger.info("delete position -> name : " + position.getId());
        try {
            if (positionService.deleteByPrimaryKey(position.getId()) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.info("delete position fail -> id : " + position.getId());
            e.printStackTrace();
        }
    }

    @RequestMapping("/updatePosition")
    @RequiresPermissions("position:update")
    @PermissionName("更新职位")
    public void updatePosition(Position position, HttpServletResponse response) {
        logger.info("update position -> name : " + position.getPosName());
        try {
            if (positionService.updateByPrimaryKeySelective(position) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.info("update position fail -> name : " + position.getPosName());
            e.printStackTrace();
        }
    }
}
