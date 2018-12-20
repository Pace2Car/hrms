package com.pace2car.controller;

import com.pace2car.bean.Appraise;
import com.pace2car.bean.Attendance;
import com.pace2car.service.AppraiseService;
import com.pace2car.service.AttendanceService;
import com.pace2car.shiro.anno.PermissionName;
import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * 绩效考核
 * @author Pace2Car
 * @date 2018/12/17 11:31
 */
@Controller
@RequestMapping("/assess")
public class AssessController {

    static Logger logger = Logger.getLogger(AssessController.class);

    @Autowired
    private AttendanceService attendanceService;

    @Autowired
    private AppraiseService appraiseService;

    @RequestMapping("/searchAttendance")
    @RequiresPermissions("attendance:select")
    @PermissionName("查询考勤")
    public String searchAttendance(Attendance attendance, ModelMap modelMap, HttpSession session) {
        List<Attendance> attendances = null;
        if (attendance != null && attendance.getEffectDate() == null && attendance.getEndDate() == null) {
            attendance = new Attendance();
            Date eDate = new Date();
            eDate.setYear(118);
            eDate.setMonth(0);
            eDate.setDate(1);
            attendance.setEffectDate(eDate);
            Date endDate = new Date();
            endDate.setYear(118);
            endDate.setMonth(0);
            endDate.setDate(28);
            attendance.setEndDate(endDate);
        }
        attendances = attendanceService.selectAttendances(attendance);
        modelMap.addAttribute("attendances", attendances);
        session.setAttribute("attendance", attendance);

        return "attendanceList";
    }

    @RequestMapping("/searchAppraise")
    @RequiresPermissions("appraise:select")
    @PermissionName("查询考核")
    public String searchAppraise(Appraise appraise, ModelMap modelMap, HttpSession session) {
        List<Appraise> appraises = null;
        if (appraise != null && appraise.getId() != null) {
            logger.info("search appraise -> id : " + appraise.getId());
            Appraise oldAppraise = appraiseService.selectByPrimaryKey(appraise.getId());
            modelMap.addAttribute("oldAppraise", oldAppraise);
            return "updateAppraise";
        }
        appraises = appraiseService.selectAppraises(appraise);
        modelMap.addAttribute("appraises", appraises);
        session.setAttribute("appraise", appraise);

        return "appraiseList";
    }

    @RequestMapping("/insertAppraise")
    @RequiresPermissions("appraise:insert")
    @PermissionName("新增考核")
    public void insertAppraise(Appraise appraise, HttpServletResponse response) {
        logger.info("insert appraise -> id : " + appraise.getId());
        appraise.setAppResult(appraise.getAppResult().toUpperCase());
        try {
            if (appraiseService.insertSelective(appraise) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.warn("insert appraise fail -> id : " + appraise.getId());
            e.printStackTrace();
        }
    }

    @RequestMapping("/updateAppraise")
    @RequiresPermissions("appraise:update")
    @PermissionName("更新考核")
    public void updateAppraise(Appraise appraise, HttpServletResponse response) {
        logger.info("update appraise -> id : " + appraise.getId());
        appraise.setAppResult(appraise.getAppResult().toUpperCase());
        try {
            if (appraiseService.updateByPrimaryKeySelective(appraise) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.info("update appraise fail -> id : " + appraise.getId());
            e.printStackTrace();
        }
    }
}
