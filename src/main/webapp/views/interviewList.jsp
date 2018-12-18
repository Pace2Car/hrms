<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>面试安排-人力资源管理系统</title>

    <link href="vendor/css/inspiniaen/datatables.min.css" rel="stylesheet">
    <link href="vendor/css/inspiniaen/style.css" rel="stylesheet">
    <link href="js/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/dropzone.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">
    <link href="vendor/css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
    <link href="vendor/css/plugins/datapicker/datepicker3.css" rel="stylesheet">

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
                        <a href="javascript:void(0)">面试安排</a>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
        <!-- main 主体区域 -->
        <div class="wrapper wrapper-content animated fadeIn">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <!-- main 在此显示内容 -->
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>面试安排表</h5>
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
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="姓名: activate to sort column descending" style="width: 238px;">姓名</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="联系电话: activate to sort column descending" style="width: 238px;">联系电话</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="预约时间: activate to sort column ascending" style="width: 417px;">预约时间</th>
                                        <th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="状态: activate to sort column ascending" style="width: 417px;"  aria-sort="ascending">状态</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="操作: activate to sort column ascending" style="width: 377px;">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbody">
                                    <c:forEach var="interview" items="${interviews}">
                                        <tr id="tr_${interview.id}" class="gradeA odd" role="row">
                                            <td>${interview.name}</td>
                                            <td>${interview.phoneNo}</td>
                                            <td><fmt:formatDate value="${interview.appointmentTime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                                            <td class="sorting_4">
                                                <c:if test="${interview.status == 1}">
                                                    已安排
                                                </c:if>
                                                <c:if test="${interview.status == 0}">
                                                    待处理
                                                </c:if>
                                            </td>
                                            <td class="center">
                                                <c:if test="${interview.status == 0}">
                                                    <a id="td_${interview.id}_0" href="#" interviewId="${interview.id}" onclick="toUpdate(this)"
                                                       class="btn btn-info btn-sm" data-toggle="modal" appointmentTime="<fmt:formatDate value="${interview.appointmentTime}" pattern="yyyy-MM-dd"></fmt:formatDate>"
                                                       data-target="#updateModal" data-backdrop="static">
                                                        <span class="glyphicon glyphicon-time"></span> 安排面试</a>
                                                </c:if>
                                                <c:if test="${interview.status == 1}">
                                                    <a id="td_${interview.id}_1" href="#" interviewId="${interview.id}" onclick="toUpdate(this)"
                                                       class="btn btn-warning btn-sm" data-toggle="modal" appointmentTime="<fmt:formatDate value="${interview.appointmentTime}" pattern="yyyy-MM-dd"></fmt:formatDate>"
                                                       data-target="#updateModal" data-backdrop="static">
                                                        <span class="glyphicon glyphicon-refresh"></span> 更改时间</a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th rowspan="1" colspan="1">姓名</th>
                                        <th rowspan="1" colspan="1">联系电话</th>
                                        <th rowspan="1" colspan="1">预约时间</th>
                                        <th rowspan="1" colspan="1">状态</th>
                                        <th rowspan="1" colspan="1">操作</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2"></div>
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
<!-- Clock picker -->
<script src="vendor/js/plugins/clockpicker/clockpicker.js"></script>
<!-- Date range use moment.js same as full calendar plugin -->
<script src="vendor/js/plugins/fullcalendar/moment.min.js"></script>
<!-- Data picker -->
<script src="vendor/js/plugins/datapicker/bootstrap-datepicker.js"></script>

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


        $('#data_1 .input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: true,
            forceParse: true,
            calendarWeeks: true,
            autoclose: true
        });

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

<!-- 更新模态框 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="updateModal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    预约面试
                </h4>
            </div>
            <div class="modal-body text-center">
                <form class="form-horizontal" role="form" id="updateForm">
                    <input type="hidden" id="upInterviewId" name="id" value="0" >
                    <div class="form-inline">
                        <div class="form-group">
                            <div id="data_1">
                                <div class="input-group date">
                                    <span class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                        预约时间：
                                    </span>
                                    <input style="width: 300px" type="text" class="form-control" id="newAppointmentTime" value=""
                                           name="appointmentTime" placeholder="请选择时间">
                                </div>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
                <button id="updateBtn" type="button" class="btn btn-primary">
                    提交更改
                </button>
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
        var interviewId = $(e).attr('interviewId');
        var oldTime = $(e).attr('appointmentTime');
        $("#newAppointmentTime").val(oldTime);
        $("#updateBtn").click(function () {
            var appointmentTime = $("#newAppointmentTime").val();
            $.get("recruit/updateInterview?id="+interviewId+"&appointmentTime="+appointmentTime, function (json) {
                $("#tr_" + interviewId + " td:eq(2)").text(appointmentTime.substring(6,10)+"-"+appointmentTime.substring(0,2)+"-"+appointmentTime.substring(3,5));
                if (json.actionFlag) {
                    $('#successAlert').slideDown();
                    setTimeout("$('#successAlert').fadeOut()", 3000);
                } else {
                    $('#failAlert').slideDown();
                    setTimeout("$('#failAlert').fadeOut()", 3000);
                }
                $('#updateModal').modal("hide");
            },"json");
        });
    }

</script>

</html>
