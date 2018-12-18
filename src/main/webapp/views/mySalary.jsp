<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>我的薪资-在线考试后台管理系统</title>

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
                <h2>薪资管理</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="views/index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">薪资管理</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">我的薪资</a>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
        <!-- main 主体区域 -->
        <div id="mainContainer" class="wrapper wrapper-content animated fadeInRight">

            <div class="ibox-content p-xl">
                <div class="row">
                    <div class="col-sm-6">
                        <span><strong>所属公司:</strong> xxx有限公司</span><br/>
                        <%
                            Date d = new Date();
                            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            String now = df.format(d);
                        %>
                        <span><strong>工资月份:</strong> <%=now.substring(0, 7)%></span><br/>
                        <span><strong>当前时间:</strong> <%=now%></span><br/>
                    </div>
                </div>

                    <div class="table-responsive m-t">
                        <table class="table invoice-table">
                            <thead>
                            <tr>
                                <th style="width: 100px">工号</th>
                                <th style="width: 200px">姓名</th>
                                <th style="width: 200px">部门</th>
                                <th style="width: 250px">基本工资</th>
                                <th style="width: 250px">绩效奖金</th>
                                <th style="width: 200px">应扣工资</th>
                                <th style="width: 200px">合计</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>${mySalary.empNo}</td>
                                <td>${mySalary.empName}</td>
                                <td>${mySalary.deptName}</td>
                                <td>￥${mySalary.baseSalary}</td>
                                <td>￥${mySalary.bonus}</td>
                                <td>￥${mySalary.mulct}</td>
                                <td>￥${mySalary.baseSalary+mySalary.bonus-mySalary.mulct}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div><!-- /table-responsive -->

                    <table class="table invoice-total">
                        <tbody>
                        <tr>
                            <td><strong>社保代缴 :</strong></td>
                            <td>￥${socialSecurity}</td>
                        </tr>
                        <tr>
                            <td><strong>应扣所得税 :</strong></td>
                            <td>￥${tax}</td>
                        </tr>
                        <tr>
                            <td><strong>实发工资 :</strong></td>
                            <td>￥${(mySalary.baseSalary+mySalary.bonus-mySalary.mulct)-socialSecurity-tax}</td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="text-right">
                        <a href="salary/printMySalary" target="_blank" class="btn btn-primary"><i
                                class="fa fa-print"></i> 打印 </a>
                    </div>

                    <div class="well m-t"><strong>注意：</strong>
                        该工资明细为公司内部保密，仅供个人工资票据，不可与他人传看，否则公司将有权利
                        依法解除劳动关系，不予补偿。
                    </div>
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

</body>

</html>
