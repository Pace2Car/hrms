package com.pace2car.controller;

import com.pace2car.shiro.anno.PermissionName;
import com.pace2car.shiro.bean.*;
import com.pace2car.shiro.service.*;
import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

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

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private RolePermissionService rolePermissionService;

    @Autowired
    private RequestMappingHandlerMapping handlerMapping;

    @RequestMapping("/searchUser")
    @RequiresPermissions("user:select")
    @PermissionName("查询用户")
    public String searchUser(User user, ModelMap modelMap, HttpSession session) {
        List<User> users = null;
        if (user != null && user.getId() != null) {
            logger.info("searchUser -> id : " + user.getId());
            User oldUser = userService.selectByPrimaryKey(user.getId());
            modelMap.addAttribute("oldUser", oldUser);
            return "updateUser";
        }
        users = userService.selectUsers(user);
        modelMap.addAttribute("users", users);
        session.setAttribute("user", user);

        return "userList";
    }

    @RequestMapping("/insertUser")
    @RequiresPermissions("user:insert")
    @PermissionName("新增用户")
    public void insertUser(User user, HttpServletResponse response) {
        logger.info("insert user -> name : " + user.getUsername());
        Md5Hash md5Hash = new Md5Hash("111111", user.getUsername());
        user.setPassword(md5Hash.toString());
        try {
            if (userService.insertSelective(user) > 0) {
                UserRole userRole = new UserRole();
                userRole.setUid(user.getId());
                userRole.setRid(user.getRid());
                if (userRoleService.insertSelective(userRole) > 0) {
                    response.getWriter().write("{\"actionFlag\": true}");
                } else {
                    response.getWriter().write("{\"actionFlag\": false}");
                }
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.warn("insert user fail -> name : " + user.getUsername());
            e.printStackTrace();
        }
    }

    @RequestMapping("/updateUser")
    @RequiresPermissions("user:update")
    @PermissionName("更新用户")
    public void updateUser(User user, HttpServletResponse response) {
        logger.info("update user -> id : " + user.getId());
        UserRole userRole = new UserRole();
        userRole.setUid(user.getId());
        userRole.setRid(user.getRid());
        try {
            if (userRoleService.updateByUserIdSelective(userRole) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.warn("update user fail -> id : " + user.getId());
            e.printStackTrace();
        }
    }

    @RequestMapping("/editStatusUser")
    @RequiresPermissions("user:update")
    @PermissionName("更新用户")
    public void editStatusUser(User user, HttpServletResponse response) {
        logger.info("editStatus user -> id : " + user.getId());
        User oldUser = userService.selectByPrimaryKey(user.getId());
        if (oldUser.getStatus()) {
            user.setStatus(false);
        } else {
            user.setStatus(true);
        }
        try {
            if (userService.updateByPrimaryKeySelective(user) > 0) {
                response.getWriter().write("{\"actionFlag\": true}");
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.warn("editStatus user fail -> id : " + user.getId());
            e.printStackTrace();
        }
    }

    @RequestMapping(value = {"/load_rolePermission"}, method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    @RequiresPermissions("permission:select")
    @PermissionName("查询权限")
    public List<RolePermission> loadRolePermission(RolePermission rolePermission) {
        return rolePermissionService.selectPermissionsByRid(rolePermission.getRid());
    }

    @RequestMapping(value = {"/load_roles"}, method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    @RequiresPermissions("role:select")
    @PermissionName("查询角色")
    public List<Role> loadRoles() {
        return roleService.selectAllRoles();
    }

    @RequestMapping("/searchRole")
    @RequiresPermissions("role:select")
    @PermissionName("查询角色")
    public String searchRole(Role role, ModelMap modelMap, HttpSession session) {
        List<Role> roles = null;
        List<Permission> permissions = permissionService.selectAllPermissions();
        modelMap.addAttribute("permissions", permissions);
        if (role != null && role.getId() != null) {
            logger.info("searchRole -> id : " + role.getId());
            Role oldRole = roleService.selectByPrimaryKey(role.getId());
            modelMap.addAttribute("oldRole", oldRole);
            return "updateRole";
        }
        roles = roleService.selectAllRoles();
        modelMap.addAttribute("roles", roles);
        session.setAttribute("role", role);

        return "roleList";
    }

    @RequestMapping("/insertRole")
    @RequiresPermissions("role:insert")
    @PermissionName("新增角色")
    public void insertRole(Role role, HttpServletResponse response) {
        logger.info("insert role -> name : " + role.getName());
        try {
            if (roleService.insertSelective(role) > 0) {
                addRolePermission(role, response);
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.warn("insert role fail -> name : " + role.getName());
            e.printStackTrace();
        }
    }

    @RequestMapping("/updateRole")
    @RequiresPermissions("role:update")
    @PermissionName("更新角色")
    public void updateRole(Role role, HttpServletResponse response) {
        logger.info("update role -> id : " + role.getId());
        try {
            if (role!= null && role.getPermissionList() != null) {
                rolePermissionService.deleteByRid(role.getId());
                addRolePermission(role, response);
            } else {
                response.getWriter().write("{\"actionFlag\": false}");
            }
        } catch (IOException e) {
            logger.warn("update role fail -> id : " + role.getId());
            e.printStackTrace();
        }
    }

    private void addRolePermission(Role role, HttpServletResponse response) throws IOException {
        RolePermission rolePermission = new RolePermission();
        rolePermission.setRid(role.getId());
        for (Integer pid : role.getPermissionList()) {
            rolePermission.setPid(pid);
            rolePermissionService.insertSelective(rolePermission);
        }
        response.getWriter().write("{\"actionFlag\": true}");
    }


    /**
     * 将系统中所有的权限表达式装入数据库
     */
    @RequestMapping("/reloadPermission")
    @RequiresPermissions("permission:insert")
    @PermissionName("刷新权限")
    public String reloadPermission(ModelMap modelMap) {
        //已有的资源
        List<String> resourcesList = permissionService.selectAllResources();
        // 获取所有Controller中带有@RequestMapping标签的方法
        Map<RequestMappingInfo, HandlerMethod> handlerMethods = handlerMapping.getHandlerMethods();
        Collection<HandlerMethod> methods = handlerMethods.values();
        for (HandlerMethod method : methods) {
            // 遍历所有方法，判断是否有@RequiresPermissions标签
            RequiresPermissions anno = method.getMethodAnnotation(RequiresPermissions.class);
            if (anno != null) {
                // 需要的权限表达式
                String resource = anno.value()[0];

                if (resourcesList.contains(resource)) {
                    continue;
                }
                logger.info(resource);
                resourcesList.add(resource);
                Permission p = new Permission();
                p.setResource(resource);
                p.setName(method.getMethodAnnotation(PermissionName.class).value());
                permissionService.insertSelective(p);
            }
        }
        resourcesList = permissionService.selectAllResources();
        modelMap.addAttribute("resourcesList", resourcesList);

        return "index";
    }
}
