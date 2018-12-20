<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>用户管理-人力资源管理系统</title>

    <link href="vendor/css/inspiniaen/datatables.min.css" rel="stylesheet">
    <link href="vendor/css/inspiniaen/style.css" rel="stylesheet">
    <link href="js/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/dropzone.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">

    <style>
        div.dataTables_wrapper div.dataTables_filter input {
            width: 300px;
            margin-right: 100px;
        }
    </style>

</head>

<body>

<div id="wrapper">
    <%@include file="navigation.jsp"%>

    <div id="page-wrapper" class="gray-bg">
        <!-- header 顶部包装区域 -->
        <%@include file="header.jsp"%>
        <!-- 顶部导航 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>系统管理</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="views/index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">系统管理</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">用户管理</a>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
        <!-- main 主体区域 -->
        <div class="wrapper wrapper-content animated fadeIn">
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-10">
                    <!-- main 在此显示内容 -->
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>用户信息表</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="fa fa-wrench"></i>
                                </a>
                                <a class="close-link">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-sm-2">
                                    <a href="#" onclick="toInsert()"
                                       class="btn btn-success btn-sm" data-toggle="modal"
                                       data-target="#insertModal" data-backdrop="static">
                                        <span class="fa fa-plus"></span> 新增用户</a>
                                    <br/><br/>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover dataTables-example dataTable" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info" role="grid">
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="员工编号: activate to sort column descending" style="width: 238px;" aria-sort="ascending">员工编号</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="用户名: activate to sort column ascending" style="width: 217px;">用户名</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="角色: activate to sort column ascending" style="width: 317px;">角色</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="创建时间: activate to sort column ascending" style="width: 417px;">创建时间</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="最后登录时间: activate to sort column ascending" style="width: 417px;">最后登录时间</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="操作: activate to sort column ascending" style="width: 300px;">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbody">
                                    <c:forEach var="user" items="${users}">
                                        <tr id="tr_${user.id}" class="gradeA odd" role="row">
                                            <td class="sorting_1">${user.empNo}</td>
                                            <td>${user.username}</td>
                                            <td>${user.roleName}</td>
                                            <td><fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                            <td><fmt:formatDate value="${user.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                            <td class="center">
                                                <a href="#" userId="${user.id}" onclick="toUpdate(this)"
                                                   class="btn btn-success btn-sm" data-toggle="modal"
                                                   data-target="#updateModal" data-backdrop="static">
                                                    <span class="glyphicon glyphicon-search"></span> 更改角色</a>
                                                <c:if test="${!user.status}">
                                                    <a id="td_${user.id}_0" href="#" userId="${user.id}" onclick="toAllow(this)"
                                                       class="btn btn-info btn-sm" data-toggle="modal">
                                                        <span class="glyphicon glyphicon-refresh"></span> 允许登录</a>
                                                </c:if>
                                                <c:if test="${user.status}">
                                                    <a id="td_${user.id}_1" href="#" userId="${user.id}" userName="${user.username}" onclick="toBan(this)"
                                                       class="btn btn-danger btn-sm" data-toggle="modal"
                                                       data-target="#deleteModal" data-backdrop="static">
                                                        <span class="glyphicon glyphicon-ban-circle"></span> 禁止登录</a>
                                                </c:if>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th rowspan="1" colspan="1">员工编号</th>
                                        <th rowspan="1" colspan="1">用户名</th>
                                        <th rowspan="1" colspan="1">角色</th>
                                        <th rowspan="1" colspan="1">创建时间</th>
                                        <th rowspan="1" colspan="1">最后登录时间</th>
                                        <th rowspan="1" colspan="1">操作</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-1"></div>
            </div>
        </div>
        <!-- footer 底部包装区域 -->
        <%@include file="footer.jsp"%>
    </div>

</div>


<!-- Mainly scripts -->
<script src="js/jquery-2.2.4.js"></script>
<script src="js/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="vendor/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="vendor/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="vendor/js/datatables.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="vendor/js/inspinia.js"></script>
<script src="vendor/js/plugins/pace/pace.min.js"></script>

<!-- DROPZONE -->
<script src="vendor/js/plugins/dropzone/dropzone.js"></script>


<script>
    $(document).ready(function () {

        Dropzone.options.myAwesomeDropzone = {

            autoProcessQueue: false,
            uploadMultiple: true,
            parallelUploads: 100,
            maxFiles: 100,

            // Dropzone settings
            init: function () {
                var myDropzone = this;

                this.element.querySelector("button[type=submit]").addEventListener("click", function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    myDropzone.processQueue();
                });
                this.on("sendingmultiple", function () {

                });
                this.on("successmultiple", function (files, response) {
                    console.log("successmultiple>>>>>" + response);
                });
                this.on("errormultiple", function (files, response) {
                    console.log(response);
                });
            }
        }

    });
    $(document).ready(function(){
        $('.dataTables-example').DataTable({
            pageLength: 10,
            responsive: true,
            dom: '<"html5buttons"B>lTfgitp',
            buttons: [

            ]

        });

    });
</script>
<!-- 添加模态框 -->
<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="insertModal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" > 添加用户 </h4>
            </div>
            <div class="modal-body text-center">
                <form class="form-horizontal" role="form" id="insertForm">
                    <div class="form-inline">
                        <div class="form-group">
                            <div class="input-group input-group-md">
                                <div class="input-group-addon" style="width: 110px;">用户名：</div>
                                <input style="width: 300px" type="text" class="form-control" id="newUsername"
                                       name="username" placeholder="默认密码：111111">
                            </div>
                            <br/><br/>
                            <div class="input-group input-group-md">
                                <div class="input-group-addon" style="width: 110px;">工号：</div>
                                <input style="width: 300px" type="number" class="form-control" id="newEmpNo"
                                       name="empNo" placeholder="请输入员工工号" min="0" />
                            </div>
                            <br/><br/>
                            <div class="input-group input-group-md">
                                <div class="input-group-addon" style="width: 110px">角色：</div>
                                <select name="rid" id="newRid"
                                        style="width: 300px"
                                        class="form-control"
                                        aria-controls="editable">
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="insertBtn" type="button" class="btn btn-primary">添加</button>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 更新模态框 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="updateModal-content">

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 删除模态框 -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel"> 禁止确认 </h4>
            </div>
            <div class="modal-body">
                <span class="fa fa-exclamation fa-2x" style="color:#f15b6c;"></span>
                您确定禁止：<strong><span id="userMsg"></span></strong> 登录系统吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="deleteConfirmBtn" type="button" class="btn btn-primary">禁止</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--成功提示模态框--%>
<div id="successAlert" class="alert alert-success col-md-2"
     style="margin-right: 5px;position: fixed; right: 10px; bottom: 30px;">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong>成功！</strong>操作成功！
</div>
<div id="failAlert" class="alert alert-warning col-md-2"
     style="margin-right: 5px;position: fixed; right: 10px; bottom: 30px;">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong style="color: red">失败！</strong>操作失败！
</div>
</body>

<script>
    $(function () {
        $('#successAlert').hide();
        $('#failAlert').hide();
    });

    function toUpdate(e) {
        $("#updateModal-content").empty();
        var userId = $(e).attr('userId');
        console.dirxml(userId);
        $.get("system/searchUser?id=" + userId, function (html) {
            $("#updateModal-content").append(html);
        }, "html");
    }

    function toInsert() {
        // 加载部门名下拉列表
        $.get("system/load_roles",function (resp) {
            // console.log(resp);
            $("#newRid").empty();
            // $("#newRid").append("<option value=''>-不限-</option>");
            $.each(resp, function (i,v) {
                var option = new Option(v.name, v.id);
                $("#newRid").append(option);
            });
        },"json");
        $("#insertBtn").click(function () {
            console.dirxml($("#username").val());
            var user = $("#insertForm").serialize();
            $.post("system/insertUser", user, function (json) {
                if (json.actionFlag) {
                    $('#successAlert').slideDown();
                    setTimeout("$('#successAlert').fadeOut()", 3000);
                } else {
                    $('#failAlert').slideDown();
                    setTimeout("$('#failAlert').fadeOut()", 3000);
                }
                $('#insertModal').modal('hide');
                location.reload();
            }, "json");
            return false;
        });
    }
    function toBan(e) {
        var userId = $(e).attr('userId');
        var userName = $(e).attr('userName');
        $("#userMsg").text(userName);
        $("#deleteConfirmBtn").click(function () {
            $('#deleteModal').modal('hide');
            $.get("system/editStatusUser?id=" + userId, function (json) {
                if (json.actionFlag) {
                    $('#successAlert').slideDown();
                    setTimeout("$('#successAlert').fadeOut()", 3000);
                    setTimeout("location.replace('system/searchUser')", 200);
                } else {
                    $('#failAlert').slideDown();
                    setTimeout("$('#failAlert').fadeOut()", 3000);
                }
            }, "json");
        });
    }

    function toAllow(e) {
        var userId = $(e).attr('userId');
        $.get("system/editStatusUser?id=" + userId, function (json) {
            if (json.actionFlag) {
                $('#successAlert').slideDown();
                setTimeout("$('#successAlert').fadeOut()", 3000);
                setTimeout("location.replace('system/searchUser')", 200);
            } else {
                $('#failAlert').slideDown();
                setTimeout("$('#failAlert').fadeOut()", 3000);
            }
        }, "json");
    }
</script>

</html>
