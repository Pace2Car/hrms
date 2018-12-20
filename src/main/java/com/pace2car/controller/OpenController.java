package com.pace2car.controller;

import com.pace2car.shiro.service.UserService;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 开放权限接口
 * @author Pace2Car
 * @date 2018/12/6 13:51
 */
@Controller
@RequestMapping("/open")
public class OpenController {

    static Logger logger = Logger.getLogger(OpenController.class);

    @Autowired
    UserService userService;

    @RequestMapping("/login")
    public String login(HttpSession session, HttpServletRequest request) {
        // 获取登录失败异常信息
        String failureMessage = (String) request.getAttribute("shiroLoginFailure");
        // 根据返回的异常信息判断返回的异常信息
        if (failureMessage != null) {
            session.setAttribute("errorMsg", "账号或密码错误");
        } else {
            session.setAttribute("errorMsg", "请先登录");
        }
        return "redirect:/login.jsp";
    }

    @RequestMapping("/logOut")
    public String logOut(HttpSession session) {
        SecurityUtils.getSubject().logout();
        return "redirect:/login.jsp";
    }

    @RequestMapping("/noPermission")
    public String noPermission() {
        return "noPermission";
    }
}
