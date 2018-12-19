package com.pace2car.controller;

import com.pace2car.shiro.bean.User;
import com.pace2car.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 系统管理（管理员权限）
 * @author Pace2Car
 * @date 2018/12/17 17:32
 */
@Controller
@RequestMapping("/system")
public class SystemController {

    static Logger logger = Logger.getLogger(SystemController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("/searchUser")
    public String searchUser(User user, ModelMap modelMap, HttpSession session) {
        List<User> users = null;
        users = userService.selectUsers(user);
        modelMap.addAttribute("users", users);
        session.setAttribute("user", user);

        return "userList";
    }

}
