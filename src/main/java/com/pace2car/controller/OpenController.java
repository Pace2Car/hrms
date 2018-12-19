package com.pace2car.controller;

import com.pace2car.shiro.bean.User;
import com.pace2car.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String login(User user, HttpSession session) {
        User usersInfo = userService.selectByLogin(user);
        logger.info(usersInfo);
        if (usersInfo != null) {
            session.setAttribute("logUser", usersInfo);
            return "redirect:/views/index.jsp";
        }

        return "redirect:/login.jsp";
    }

    @RequestMapping("/logOut")
    public String logOut(HttpSession session) {
        session.removeAttribute("logUser");
        return "redirect:/login.jsp";
    }
}
