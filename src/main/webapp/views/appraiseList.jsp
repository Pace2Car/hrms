<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>员工考核-人力资源管理系统</title>

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
                <h2>绩效考核</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="views/index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">绩效考核</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">员工考核</a>
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
                            <h5>员工考核表</h5>
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
                                        <span class="fa fa-plus"></span> 新增考核</a>
                                    <br/><br/>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover dataTables-example dataTable" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info" role="grid">
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="员工姓名: activate to sort column descending" style="width: 238px;" aria-sort="ascending">员工姓名</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="考评内容: activate to sort column ascending" style="width: 417px;">考评内容</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="考评日期: activate to sort column ascending" style="width: 417px;">考评日期</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="考评结果: activate to sort column ascending" style="width: 417px;">考评结果</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="考评等级: activate to sort column ascending" style="width: 417px;">考评等级</th>
                                        <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="操作: activate to sort column ascending" style="width: 377px;">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbody">
                                    <c:forEach var="appraise" items="${appraises}">
                                        <tr id="tr_${appraise.id}" class="gradeA odd" role="row">
                                            <td>${appraise.empName}</td>
                                            <td>${appraise.appContent}</td>
                                            <td><fmt:formatDate value="${appraise.appDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                            <td>
                                                <c:if test="${appraise.appStatus == 0}">不合格</c:if>
                                                <c:if test="${appraise.appStatus == 1}">合格</c:if>
                                            </td>
                                            <td>${appraise.appResult}</td>
                                            <td class="center">
                                                <a href="#" appraiseId="${appraise.id}" onclick="toUpdate(this)"
                                                   class="btn btn-info btn-sm" data-toggle="modal"
                                                   data-target="#updateModal" data-backdrop="static">
                                                    <span class="glyphicon glyphicon-search"></span> 详细信息</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th rowspan="1" colspan="1">员工姓名</th>
                                        <th rowspan="1" colspan="1">考评内容</th>
                                        <th rowspan="1" colspan="1">考评日期</th>
                                        <th rowspan="1" colspan="1">考评结果</th>
                                        <th rowspan="1" colspan="1">考评等级</th>
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
<!-- 添加模态框 -->
<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="insertModal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" > 添加考评 </h4>
            </div>
            <div class="modal-body text-center">
                <form class="form-horizontal" role="form" id="insertForm">
                    <div class="form-inline">
                        <div class="form-group">
                            <div class="input-group input-group-md">
                                <div class="input-group-addon" style="width: 110px">员工编号：</div>
                                <input  type="number" name="empNo" id="newEmpNo"
                                        style="width: 300px"
                                        class="form-control" placeholder="员工编号"
                                        aria-controls="editable" min="0" />
                            </div>
                            <br/><br/>
                            <div class="input-group input-group-md">
                                <div class="input-group-addon" style="width: 110px;">考评内容：</div>
                                <input style="width: 300px" type="text" class="form-control" id="newAppContent"
                                       name="appContent" placeholder="请输入考评内容">
                            </div>
                            <br/><br/>
                            <div class="input-group input-group-md">
                                <div class="input-group-addon" style="width: 110px">是否通过：</div>
                                <select name="appStatus"
                                        style="width: 300px"
                                        class="form-control"
                                        aria-controls="editable">
                                    <option style="background-color: #c8ffab" value="1" selected> 合格</option>
                                    <option style="background-color: #ff5100" value="0" > 不合格</option>
                                </select>
                            </div>
                            <br/><br/>
                            <div class="input-group input-group-md">
                                <div class="input-group-addon" style="width: 110px;">考评等级：</div>
                                <input style="width: 300px" type="text" class="form-control"
                                       name="appResult" placeholder="请输入考评等级">
                            </div>
                            <br/><br/>
                            <div class="input-group input-group-md">
                                <div class="input-group-addon" style="width: 110px;">备注：</div>
                                <input style="width: 300px" type="text" class="form-control"
                                       name="remark" placeholder="请输入备注">
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
        var appraiseId = $(e).attr('appraiseId');
        $.get("assess/searchAppraise?id=" + appraiseId, function (html) {
            $("#updateModal-content").append(html);
        }, "html");
    }

    function toInsert() {
        $("#insertBtn").click(function () {
            var appraise = $("#insertForm").serialize();
            $.post("assess/insertAppraise", appraise, function (json) {
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
</script>

</html>
