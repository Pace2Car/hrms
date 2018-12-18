<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>发布招聘-人力资源管理系统</title>

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
                        <a href="javascript:void(0)">发布招聘</a>
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
                            <h5>发布招聘</h5>
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
                                <div style="height: 480px" class="form-inline">
                                    <div class="form-group">
                                        <div class="col-lg-6">
                                            <div class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px;">标题：</div>
                                                <input style="width: 300px" type="text" id="title" class="form-control"
                                                       name="title" placeholder="一个简洁明了的标题" required>
                                            </div>
                                            <br/><br/>
                                            <div class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px;">工作地点：</div>
                                                <input style="width: 300px" type="text" class="form-control"
                                                       name="workPlace" placeholder="请输入工作地点">
                                            </div>
                                            <br/><br/>
                                            <div class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px;">薪资下限(k)：</div>
                                                <input style="width: 300px" type="number" class="form-control"
                                                       name="minSalary" placeholder="请输入薪资下限" min="0">
                                            </div>
                                            <br/><br/>
                                            <div class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px;">薪资上限(k)：</div>
                                                <input style="width: 300px" type="number" class="form-control"
                                                       name="maxSalary" placeholder="请输入薪资上限" min="0">
                                            </div>
                                            <br/><br/>
                                            <div class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px">学历要求：</div>
                                                <select name="education"
                                                        style="width: 300px"
                                                        class="form-control"
                                                        aria-controls="editable">
                                                    <option value="不限" selected> 不限</option>
                                                    <option value="研究生及以上" > 研究生及以上</option>
                                                    <option value="本科" > 本科</option>
                                                    <option value="大专" > 大专</option>
                                                    <option value="高中及以下" > 高中及以下</option>
                                                </select>
                                            </div>
                                            <br/><br/>
                                            <div class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px">工作经验：</div>
                                                <select name="experience"
                                                        style="width: 300px"
                                                        class="form-control"
                                                        aria-controls="editable">
                                                    <option value="不限" selected> 不限</option>
                                                    <option value="10年以上"> 10年以上</option>
                                                    <option value="5-10年" > 5-10年</option>
                                                    <option value="3-5年" > 3-5年</option>
                                                    <option value="1-3年" > 1-3年</option>
                                                    <option value="应届生" > 应届生</option>
                                                </select>
                                            </div>
                                            <br/><br/>
                                            <div class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px">职位：</div>
                                                <select name="positionId" id="newPositionId"
                                                        style="width: 300px"
                                                        class="form-control"
                                                        aria-controls="editable">
                                                </select>
                                            </div>
                                            <br/><br/>
                                            <div class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px">需求人数：</div>
                                                <input style="width: 300px" type="number" class="form-control"
                                                       name="numberOfRecruit" placeholder="请输入需求人数" min="0">
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="input-group input-group-md">
                                                <div class="input-group-addon" style="width: 110px">需求描述：</div>
                                                <textarea class="form-control" style="width: 300px;height: 419px;resize: none"
                                                          name="description" placeholder="请输入详细描述及工作内容"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <hr/>
                                    <div class="col-lg-3"></div>
                                    <div class="col-lg-6 text-center">
                                        <button id="addBtn" type="button" class="btn btn-primary">
                                            <i class="fa fa-upload"></i>
                                            发布
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
    <strong style="color: red">失败！</strong>请填写标题！
</div>
<script>
    $(function () {
        // 加载职位名下拉列表
        $.get("position/load_posis",function (resp) {
            // console.log(resp);
            $("#newPositionId").empty();
            // $("#newDeptNo").append("<option value=''>不限--</option>");
            $.each(resp, function (i,v) {
                var option = new Option(v.posName, v.id);
                $("#newPositionId").append(option);
            });
        },"json");
    })
</script>
</body>

<script>
    $(function () {
        $('#successAlert').hide();
        $('#failAlert').hide();
        $('#notValidAlert').hide();
    });

    $("#addBtn").click(function () {
        var title = $("#title").val();
        console.dirxml(title);
        if (title.length != 0) {
            var recruitInfo = $("#insertForm").serialize();
            $.post("recruit/insertRecruit", recruitInfo, function (json) {
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
