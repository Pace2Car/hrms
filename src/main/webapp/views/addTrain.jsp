<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>申请培训-人力资源管理系统</title>

    <link href="js/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/dropzone.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">

</head>

<body>

<div id="wrapper">
    <%@include file="navigation.jsp" %>

    <div id="page-wrapper" class="gray-bg">
        <!-- header 顶部包装区域 -->
        <%@include file="header.jsp" %>
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
                        <a href="javascript:void(0)">申请培训</a>
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
                            <h5>申请培训</h5>
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
                        <div class="ibox-content text-center">
                            <form class="form-horizontal" role="form" id="insertForm">
                                <div style="height: 400px" class="form-inline">
                                    <div class="form-group">
                                        <div class="col-lg-6">
                                            <div class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px;">主题：</div>
                                                <input style="width: 300px" type="text" id="subject" class="form-control"
                                                       name="subject" placeholder="一个目的明确的主题" required>
                                            </div>
                                            <br/><br/>
                                            <div class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px;">开始时间：</div>
                                                <input style="width: 300px" type="date" class="form-control"
                                                       name="startTime" id="startTime" placeholder="请输入开始时间" min="0">
                                            </div>
                                            <br/><br/>
                                            <div class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px;">结束时间：</div>
                                                <input style="width: 300px" type="date" class="form-control"
                                                       name="endTime" placeholder="请输入结束时间" min="0">
                                            </div>
                                            <br/><br/>
                                            <div class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px">预算：</div>
                                                <input style="width: 300px" type="number" class="form-control"
                                                       name="budget" placeholder="请输入需求预算" min="0">
                                            </div>
                                            <br/><br/>
                                            <div class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px">培训类型：</div>
                                                <select name="trainType"
                                                        id="trainType"
                                                        style="width: 300px"
                                                        class="form-control"
                                                        aria-controls="editable">
                                                    <option value="1" selected> 公司培训</option>
                                                    <option value="2" > 部门培训</option>
                                                    <option value="3" > 个人培训</option>
                                                </select>
                                            </div>
                                            <br/><br/>
                                            <div id="deptNoSel" class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px">部门：</div>
                                                <select name="deptNo"
                                                        id="deptNo"
                                                        style="width: 300px"
                                                        class="form-control"
                                                        aria-controls="editable">
                                                </select>
                                            </div>
                                            <div id="empNoInp" class="input-group input-group-md" style="position: absolute;top: 276px;margin-left: 1px">
                                                <div class="input-group-addon" style="width: 110px">工号：</div>
                                                <input style="width: 300px" type="number" class="form-control"
                                                       name="empNo" placeholder="请输入员工编号" min="0">
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px">培训描述：</div>
                                                <textarea class="form-control" style="width: 300px;height: 309px;resize: none"
                                                          name="description" placeholder="请输入详细描述及培训内容"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br/><br/>
                                    <hr/>
                                    <div class="col-lg-3"></div>
                                    <div class="col-lg-6 text-center">
                                        <button id="addBtn" type="button" class="btn btn-primary">
                                            <i class="fa fa-upload"></i>
                                            提交申请
                                        </button>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <button type="reset" class="btn btn-default" data-dismiss="modal">
                                            <i class="fa fa-ban"></i>
                                            取消
                                        </button>
                                    </div>
                                    <div class="col-lg-3"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2"></div>
            </div>
        </div>
        <!-- footer 底部包装区域 -->
        <%@include file="footer.jsp" %>
    </div>

</div>


<!-- Mainly scripts -->
<script src="js/jquery-2.2.4.js"></script>
<script src="js/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="vendor/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="vendor/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

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
<div id="notValidAlert" class="alert alert-warning col-md-2"
     style="margin-right: 5px;position: fixed; right: 10px; bottom: 30px;">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong style="color: red">失败！</strong>请填写主题！
</div>
<script>
    $(function () {
        // 加载上级部门名下拉列表
        $.get("department/load_depts",function (resp) {
            // console.log(resp);
            $("#deptNo").empty();
            $("#deptNo").append("<option value=''>-请选择部门-</option>");
            $.each(resp, function (i,v) {
                var option = new Option(v.deptName, v.deptNo);
                $("#deptNo").append(option);
            });
        },"json");

        $("#trainType").change(function () {
            var type = $("#trainType :selected").val();
            console.dirxml(type);
            $('#deptNoSel').hide();
            $('#empNoInp').hide();
            if (type == 2) {
                $('#deptNoSel').fadeIn();
            } else if (type == 3) {
                $('#empNoInp').fadeIn();
            }
        });

        $("#startTime").change(function () {
            console.dirxml($("#startTime").val());
        });
    })
</script>
</body>

<script>
    $(function () {
        $('#successAlert').hide();
        $('#failAlert').hide();
        $('#notValidAlert').hide();
        $('#deptNoSel').hide();
        $('#empNoInp').hide();
    });

    $("#addBtn").click(function () {
        var subject = $("#subject").val();
        console.dirxml(subject);
        if (subject.length != 0) {
            var train = $("#insertForm").serialize();
            $.post("train/insertTrain", train, function (json) {
                if (json.actionFlag) {
                    $('#successAlert').slideDown();
                    document.getElementById("insertForm").reset();
                    setTimeout("$('#successAlert').fadeOut()", 3000);
                } else {
                    $('#failAlert').slideDown();
                    setTimeout("$('#failAlert').fadeOut()", 3000);
                }
                $('#insertModal').modal('hide');
            }, "json");
            return false;
        } else {
            $('#notValidAlert').slideDown({left:"250px"});
            setTimeout("$('#notValidAlert').fadeOut()", 3000);
        }
    });
</script>

</html>
