<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Haoge
  Date: 2018/12/6
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
</head>
<body>
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element" align="center"> <span>
                            <img alt="image" class="img-circle" src="images/admin.png"/>
                             </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong
                                    class="font-bold"><shiro:principal property="username"/></strong>
                             </span> <span class="text-muted text-xs block"><shiro:principal property="roleName" /><b
                                    class="caret"></b></span> </span> </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="javascript:void(0)">个人主页</a></li>
                        <li><a href="javascript:void(0)">今日任务</a></li>
                        <li><a href="javascript:void(0)">我的邮箱</a></li>
                        <li class="divider"></li>
                        <li><a href="open/logOut">退出登录</a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    HRMS
                </div>
            </li>
            <li>
                <a href="views/index.jsp">
                    <i class="fa fa-home"></i>
                    <span class="nav-label">&nbsp;首页</span> <span class="fa "></span>
                </a>
            </li>
            <shiro:hasAnyRoles name="hr,admin">
            <li>
                <a href="javascript:void(0)">
                    <i class="fa fa-user"></i>
                    <span class="nav-label">&nbsp;&nbsp;人事管理</span> <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level collapse">
                    <shiro:hasPermission name="employee:select">
                    <li><a href="employee/searchEmployee">员工信息列表</a></li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="position:update">
                    <li><a href="position/searchEmpPosition">职位调动</a></li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="employee:delete">
                    <li><a href="employee/getWorkEmployeeList">离退职管理</a></li>
                    </shiro:hasPermission>
                </ul>
            </li>
            </shiro:hasAnyRoles>
            <shiro:hasAnyRoles name="mgr,admin">
            <li>
                <a href="javascript:void(0)">
                    <i class="fa fa-th-list"></i>
                    <span class="nav-label">&nbsp;部门管理</span> <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level collapse">
                    <shiro:hasPermission name="department:select">
                    <li><a href="department/searchDepartment">部门信息列表</a></li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="department:update">
                    <li><a href="position/getPositionList">职位设置</a></li>
                    </shiro:hasPermission>
                </ul>
            </li>
            </shiro:hasAnyRoles>
            <li >
                <a href="javascript:void(0)">
                    <i class="fa fa-usd"></i>
                    <span class="nav-label">&nbsp;&nbsp;薪资管理</span> <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li><a href="salary/cheakMySalary">我的薪资</a></li>
                    <shiro:hasPermission name="employee:update">
                    <li><a href="salary/searchEmpSalary">薪资调整</a></li>
                    <li><a href="salary/searchEmpBM">奖惩管理</a></li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="employee:select">
                    <li><a href="salary/getSalChart">薪资统计</a></li>
                    </shiro:hasPermission>
                </ul>
            </li>
            <shiro:hasAnyRoles name="hr,admin">
            <li>
                <a href="javascript:void(0)">
                    <i class="fa fa-whatsapp"></i>
                    <span class="nav-label">&nbsp;招聘管理</span> <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li><a href="recruit/addRecruit">发布招聘</a></li>
                    <li><a href="recruit/searchRecruit">管理招聘信息</a></li>
                    <li><a href="recruit/searchResume">查看简历投递</a></li>
                    <li><a href="recruit/searchInterview">面试安排</a></li>
                </ul>
            </li>
            </shiro:hasAnyRoles>
            <li>
                <a href="javascript:void(0)">
                    <i class="fa fa-paperclip"></i>
                    <span class="nav-label">&nbsp;培训管理</span> <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li><a href="train/addTrain">申请培训</a></li>
                    <li><a href="train/checkMyTrain">我的个人培训</a></li>
                    <shiro:hasAnyRoles name="hr,admin">
                    <li><a href="train/searchTrain">培训计划管理</a></li>
                    </shiro:hasAnyRoles>
                </ul>
            </li>
            <shiro:hasAnyRoles name="hr,admin">
            <li>
                <a href="javascript:void(0)">
                    <i class="fa fa-tags"></i>
                    <span class="nav-label">绩效考核</span> <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li><a href="assess/searchAttendance">考勤管理</a></li>
                    <li><a href="assess/searchAppraise">员工考核</a></li>
                </ul>
            </li>
            </shiro:hasAnyRoles>
            <shiro:hasRole name="admin">
            <li>
                <a href="javascript:void(0)">
                    <i class="fa fa-cog"></i>
                    <span class="nav-label">系统管理</span> <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li><a href="system/searchUser">用户管理</a></li>
                    <li><a href="system/searchRole">角色管理</a></li>
                    <li><a href="system/reloadPermission">重新加载权限</a></li>
                </ul>
            </li>
            </shiro:hasRole>
        </ul>
    </div>
</nav>
</body>
</html>
