<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>我的个人培训-人力资源管理系统</title>

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
                <h2>培训管理</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="views/index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">培训管理</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">我的个人培训</a>
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
                            <h5>我的培训计划</h5>
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
                                <a href="train/checkMyTrain?status=0" style="margin-left: 20px;margin-bottom: 30px" type="button"  class="btn btn-sm btn-warning">待处理</a>
                                <a href="train/checkMyTrain?status=1" style="margin-bottom: 30px" type="button"  class="btn btn-sm btn-info">已通过</a>
                                <a href="train/checkMyTrain?status=2" style="margin-bottom: 30px" type="button"  class="btn btn-sm btn-default">已驳回</a>
                                <a href="train/checkMyTrain" style="margin-bottom: 30px" type="button"  class="btn btn-sm btn-success">全部</a>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover dataTables-example dataTable" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info" role="grid">
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="主题: activate to sort column descending" style="width: 238px;" aria-sort="ascending">主题</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="开始时间: activate to sort column ascending" style="width: 238px;">开始时间</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="结束时间: activate to sort column descending" style="width: 238px;">结束时间</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="预算: activate to sort column ascending" style="width: 417px;">预算</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="状态: activate to sort column ascending" style="width: 217px;">状态</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="操作: activate to sort column ascending" style="width: 477px;">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbody">
                                    <c:forEach var="train" items="${trains}">
                                        <tr id="tr_${train.id}" class="gradeA odd" role="row">
                                            <td class="sorting_1"><strong>${train.subject}</strong></td>
                                            <td><fmt:formatDate value="${train.startTime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                                            <td><fmt:formatDate value="${train.endTime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                                            <td>${train.budget}</td>
                                            <td>
                                                <c:if test="${train.status == 0}">待处理</c:if>
                                                <c:if test="${train.status == 1}"><strong style="color: #3756ff">已批准</strong></c:if>
                                                <c:if test="${train.status == 2}"><strong style="color: #ff1706">未通过</strong></c:if>
                                            </td>
                                            <td class="center">
                                                <a href="#" trainId="${train.id}" onclick="toDetail(this)"
                                                   class="btn btn-success btn-sm" data-toggle="modal"
                                                   data-target="#detailModal" data-backdrop="static">
                                                    <span class="glyphicon glyphicon-search"></span> 详细信息</a>
                                                <c:if test="${train.status == 2}">
                                                <a href="#" id="btn_${train.id}" trainId="${train.id}" onclick="toReApply(this)"
                                                   class="btn btn-info btn-sm" data-toggle="modal"
                                                   data-target="#detailModal" data-backdrop="static">
                                                    <span class="glyphicon glyphicon-refresh"></span> 重新申请</a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th rowspan="1" colspan="1">主题</th>
                                        <th rowspan="1" colspan="1">开始时间</th>
                                        <th rowspan="1" colspan="1">结束时间</th>
                                        <th rowspan="1" colspan="1">预算</th>
                                        <th rowspan="1" colspan="1">状态</th>
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
<!-- 详细模态框 -->
<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="detailModal-content">

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

    function toDetail(e) {
        $("#detailModal-content").empty();
        var trainId = $(e).attr('trainId');
        console.dirxml(trainId);
        $.get("train/searchTrain?id=" + trainId, function (html) {
            $("#detailModal-content").append(html);
        }, "html");
    }
    function toReApply(e) {
        $("#detailModal-content").empty();
        var trainId = $(e).attr('trainId');
        console.dirxml(trainId);
        $.get("train/searchTrain?id=" + trainId + "&status=3", function (html) {
            $("#detailModal-content").append(html);
        }, "html");
    }
</script>

</html>
