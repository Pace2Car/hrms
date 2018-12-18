<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>查看简历投递-人力资源管理系统</title>

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
                <h2>招聘管理</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="views/index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">招聘管理</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">查看简历投递</a>
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
                            <h5>简历列表</h5>
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

                            </div>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover dataTables-example dataTable" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info" role="grid">
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="姓名: activate to sort column descending" style="width: 238px;" aria-sort="ascending">姓名</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="应聘职位: activate to sort column ascending" style="width: 417px;">应聘职位</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="年龄: activate to sort column descending" style="width: 238px;">年龄</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="性别: activate to sort column ascending" style="width: 217px;">性别</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="毕业院校: activate to sort column ascending" style="width: 417px;">毕业院校</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="专业: activate to sort column ascending" style="width: 417px;">专业</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="学历: activate to sort column ascending" style="width: 217px;">学历</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="经验: activate to sort column ascending" style="width: 217px;">经验</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="联系电话: activate to sort column ascending" style="width: 417px;">联系电话</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="操作: activate to sort column ascending" style="width: 477px;">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbody">
                                    <c:forEach var="resume" items="${resumes}">
                                        <tr id="tr_${resume.id}" class="gradeA odd" role="row">
                                            <td class="sorting_1"><strong>${resume.name}</strong></td>
                                            <td>${resume.posName}</td>
                                            <td>${resume.age}</td>
                                            <td>${resume.gender}</td>
                                            <td>${resume.graduatedSchool}</td>
                                            <td>${resume.major}</td>
                                            <td>${resume.education}</td>
                                            <td>${resume.experience}</td>
                                            <td>${resume.phoneNo}</td>
                                            <td class="center">
                                                <a href="#" resumeId="${resume.id}" onclick="toPass(this)"
                                                   class="btn btn-info btn-sm" data-toggle="modal"
                                                   data-target="#updateModal" data-backdrop="static">
                                                    <span class="glyphicon glyphicon-hand-left"></span> 安排面试</a>
                                                <a href="#" resumeId="${resume.id}" onclick="toRefuse(this)"
                                                   class="btn btn-danger btn-sm" data-toggle="modal">
                                                    <span class="glyphicon glyphicon-ban-circle"></span> 不通过</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th rowspan="1" colspan="1">姓名</th>
                                        <th rowspan="1" colspan="1">年龄</th>
                                        <th rowspan="1" colspan="1">性别</th>
                                        <th rowspan="1" colspan="1">毕业院校</th>
                                        <th rowspan="1" colspan="1">专业</th>
                                        <th rowspan="1" colspan="1">学历</th>
                                        <th rowspan="1" colspan="1">经验</th>
                                        <th rowspan="1" colspan="1">应聘职位</th>
                                        <th rowspan="1" colspan="1">联系电话</th>
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

    function toPass(e) {
        var resumeId = $(e).attr('resumeId');
        $.get("recruit/updateResume?id=" + resumeId + "&result=1", function (json) {
            $("#tr_" + resumeId).remove();
            console.dirxml($("tr_" + resumeId + " td:eq(1)").text());
            if (json.actionFlag) {
                $('#successAlert').slideDown();
                setTimeout("$('#successAlert').fadeOut()", 1000);
            } else {
                $('#failAlert').slideDown();
                setTimeout("$('#failAlert').fadeOut()", 1000);
            }
        }, "json");
    }

    function toRefuse(e) {
        var resumeId = $(e).attr('resumeId');
        $.get("recruit/updateResume?id=" + resumeId + "&result=2", function (json) {
            $("#tr_" + resumeId).remove();
            console.dirxml($("tr_" + resumeId + " td:eq(1)").text());
            if (json.actionFlag) {
                $('#successAlert').slideDown();
                setTimeout("$('#successAlert').fadeOut()", 1000);
            } else {
                $('#failAlert').slideDown();
                setTimeout("$('#failAlert').fadeOut()", 1000);
            }
        }, "json");
    }
</script>

</html>
