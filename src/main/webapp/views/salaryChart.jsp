<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>薪资统计-人力资源管理系统</title>

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
                        <a href="index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">薪资管理</a>
                    </li>
                    <li>
                        <a href="tradeChart.jsp">薪资统计</a>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
        <!-- main 主体区域 -->
        <div class="wrapper wrapper-content animated fadeIn">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <!-- main 在此显示内容 -->
                    <div class="col-md-8">
                    </div>
                    <%--年份--%>
                    <div class="col-md-4">
                    <span align="right" >
                        按部门：<select id="deptNo" name="deptNo" aria-controls="editable" class="form-control" style="width: 140px;">
                        <option value=""></option>
                        </select>
                    </span>
                    </div>
                    <hr/>
                    <!-- 图表主体 -->
                    <div id="container" style="height: 700px;margin-top: 50px">
                    </div>
                </div>
                <div class="col-md-1"></div>
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

<!-- 百度EChart -->
<script type="text/javascript" src="js/echarts.js"></script>

<script type="text/javascript">
    // 初始化图表
var dom = document.getElementById("container");
var myChart = echarts.init(dom);
    $(function () {
        // 加载部门名下拉列表
        $.get("department/load_depts",function (resp) {
            // console.log(resp);
            $("#deptNo").empty();
            $("#deptNo").append("<option value='' selected>-不限-</option>");
            $.each(resp, function (i,v) {
                var option = new Option(v.deptName, v.deptNo);
                $("#deptNo").append(option);
            });
        },"json");
        //初始化数据
        getChart();

        $("#deptNo").change(function () {
            console.dirxml($("#deptNo :selected").val());
            getChart();
        });
    });

    //获取数据
    function getChart() {
        var deptNo = $("#deptNo :selected").val()
        console.dirxml(deptNo);
        $.get("salary/statistics?deptNo="+deptNo).done(function (json) {
            // 填入数据
            option = {
                title : {
                    text: 'xxx公司薪资分布',
                    subtext: '测试数据',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: ['5k以下','5k-10k','10k-15k','15k-20k','20k-30k','30k+']
                },
                series : [
                    {
                        name: '工资范围',
                        type: 'pie',
                        radius : '65%',
                        center: ['50%', '50%'],
                        data:[
                            {value:json.level1, name:'5k以下'},
                            {value:json.level2, name:'5k-10k'},
                            {value:json.level3, name:'10k-15k'},
                            {value:json.level4, name:'15k-20k'},
                            {value:json.level5, name:'20k-30k'},
                            {value:json.level6, name:'30k+'}
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };

            if (option && typeof option === "object") {
                myChart.setOption(option, true);
            }
        }, 'json');
    }


</script>

</body>

</html>
