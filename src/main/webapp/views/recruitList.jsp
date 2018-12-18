<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>管理招聘信息-人力资源管理系统</title>

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
                        <a href="javascript:void(0)">管理招聘信息</a>
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
                            <h5>招聘信息列表</h5>
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
                                        <th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="标题: activate to sort column descending" style="width: 238px;" aria-sort="ascending">标题</th>
                                        <th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="工作地点: activate to sort column descending" style="width: 238px;" aria-sort="ascending">工作地点</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="职位: activate to sort column ascending" style="width: 417px;">职位</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="工资范围: activate to sort column ascending" style="width: 417px;">工资范围</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="状态: activate to sort column ascending" style="width: 417px;">状态</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="操作: activate to sort column ascending" style="width: 377px;">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbody">
                                    <c:forEach var="recruit" items="${recruitInfos}">
                                        <tr id="tr_${recruit.id}" class="gradeA odd" role="row">
                                            <td class="sorting_1"><strong>${recruit.title}</strong></td>
                                            <td><c:if test="${empty recruit.workPlace}">不限</c:if>${recruit.workPlace}</td>
                                            <td>${recruit.posName}</td>
                                            <td>
                                                <c:if test="${recruit.minSalary == 0 && recruit.maxSalary == 0}">面议</c:if>
                                                <c:if test="${recruit.minSalary != 0 && recruit.maxSalary == 0}">${recruit.minSalary}k</c:if>
                                                <c:if test="${recruit.minSalary == 0 && recruit.maxSalary != 0}">${recruit.maxSalary}k</c:if>
                                                <c:if test="${recruit.minSalary != 0 && recruit.maxSalary != 0}">${recruit.minSalary}k-${recruit.maxSalary}k</c:if>
                                            </td>
                                            <td>
                                                <c:if test="${recruit.status == 1}">
                                                    在招
                                                </c:if>
                                                <c:if test="${recruit.status == 0}">
                                                    已停止
                                                </c:if>
                                            </td>
                                            <td class="center">
                                                <a href="#" recruitId="${recruit.id}" onclick="toUpdate(this)"
                                                   class="btn btn-success btn-sm" data-toggle="modal"
                                                   data-target="#updateModal" data-backdrop="static">
                                                    <span class="glyphicon glyphicon-search"></span> 更新信息</a>
                                                <c:if test="${recruit.status == 0}">
                                                    <a id="td_${recruit.id}_0" href="#" recruitId="${recruit.id}" onclick="toCarryOn(this)"
                                                       r_status="${recruit.status}"
                                                       class="btn btn-info btn-sm" data-toggle="modal">
                                                        <span class="glyphicon glyphicon-refresh"></span> 继续招聘</a>
                                                </c:if>
                                                <c:if test="${recruit.status == 1}">
                                                    <a id="td_${recruit.id}_1" href="#" recruitId="${recruit.id}" recruitTitle="${recruit.title}" onclick="toDelete(this)"
                                                       r_status="${recruit.status}"
                                                       class="btn btn-danger btn-sm" data-toggle="modal"
                                                       data-target="#deleteModal" data-backdrop="static">
                                                        <span class="glyphicon glyphicon-ban-circle"></span> 停止招聘</a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th rowspan="1" colspan="1">标题</th>
                                        <th rowspan="1" colspan="1">工作地点</th>
                                        <th rowspan="1" colspan="1">职位</th>
                                        <th rowspan="1" colspan="1">工资范围</th>
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
                <h4 class="modal-title" id="myModalLabel"> 停止确认 </h4>
            </div>
            <div class="modal-body">
                <span class="fa fa-exclamation fa-2x" style="color:#f15b6c;"></span>
                您确定停止对：<strong><span id="recruitMsg"></span></strong> 的招聘吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="deleteConfirmBtn" type="button" class="btn btn-primary">停止</button>
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
        var recruitId = $(e).attr('recruitId');
        $.get("recruit/searchRecruit?id=" + recruitId, function (html) {
            $("#updateModal-content").append(html);
        }, "html");
    }

    function toDelete(e) {
        var recruitId = $(e).attr('recruitId');
        var recruitTitle = $(e).attr('recruitTitle');
        $("#recruitMsg").text(recruitTitle);
        $("#deleteConfirmBtn").click(function () {
            $('#deleteModal').modal('hide');
            $.get("recruit/editStatusRecruit?id=" + recruitId, function (json) {
                if (json.actionFlag) {
                    $('#successAlert').slideDown();
                    setTimeout("$('#successAlert').fadeOut()", 3000);
                    setTimeout("location.replace('recruit/searchRecruit')", 200);
                } else {
                    $('#failAlert').slideDown();
                    setTimeout("$('#failAlert').fadeOut()", 3000);
                }
            }, "json");
        });
    }

    function toCarryOn(e) {
        var recruitId = $(e).attr('recruitId');
        $.get("recruit/editStatusRecruit?id=" + recruitId, function (json) {
            if (json.actionFlag) {
                $('#successAlert').slideDown();
                setTimeout("$('#successAlert').fadeOut()", 3000);
                setTimeout("location.replace('recruit/searchRecruit')", 200);
            } else {
                $('#failAlert').slideDown();
                setTimeout("$('#failAlert').fadeOut()", 3000);
            }
        }, "json");
    }
</script>

</html>
