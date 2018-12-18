<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>考勤管理-人力资源管理系统</title>

    <link href="vendor/css/inspiniaen/datatables.min.css" rel="stylesheet">
    <link href="vendor/css/inspiniaen/style.css" rel="stylesheet">
    <link href="js/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="vendor/css/plugins/dropzone/dropzone.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">
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
                        <a href="javascript:void(0)">考勤管理</a>
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
                    <div class="wrapper wrapper-content animated fadeInRight">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="ibox float-e-margins">
                                    <div class="ibox-title">
                                        <h5>考勤信息列表</h5>
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
                                            <select name="year" id="year"
                                                    style="width: 100px;height: 30px;margin-left: 20px"
                                                    class="form" aria-controls="editable">
                                                <option value="2018">2018</option>
                                                <option value="2019">2019</option>
                                            </select>
                                            <select name="month" id="month"
                                                    style="width: 100px;height: 30px"
                                                    class="form" aria-controls="editable">
                                                <option value="01">一月</option>
                                                <option value="02">二月</option>
                                                <option value="03">三月</option>
                                                <option value="04">四月</option>
                                                <option value="05">五月</option>
                                                <option value="06">六月</option>
                                                <option value="07">七月</option>
                                                <option value="08">八月</option>
                                                <option value="09">九月</option>
                                                <option value="10">十月</option>
                                                <option value="11">十一月</option>
                                                <option value="12">十二月</option>
                                            </select>
                                            <button onclick="getAttend()" style="margin-top: 17px;margin-bottom: 20px" type="button"  class="btn btn-sm btn-success">查看</button>
                                        </div>
                                        <div class="table-responsive">
                                            <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper form-inline dt-bootstrap"><div class="html5buttons"></div><div id="DataTables_Table_0_filter" class="dataTables_filter"></div><div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite"></div><table class="table table-striped table-bordered table-hover dataTables-example dataTable" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info" role="grid">
                                                <thead>
                                                <tr role="row">
                                                    <th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="姓名: activate to sort column descending" style="width: 238px;">姓名</th>
                                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="迟到: activate to sort column ascending" style="width: 277px;">迟到</th>
                                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="早退: activate to sort column ascending" style="width: 277px;">早退</th>
                                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="旷工: activate to sort column ascending" style="width: 277px;">旷工</th>
                                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="请假: activate to sort column ascending" style="width: 277px;">请假</th>
                                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="加班小时: activate to sort column ascending" style="width: 186px;">加班小时</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="attendance" items="${attendances}">
                                                    <tr class="gradeA odd" role="row">
                                                        <td class="sorting_1">${attendance.empName}</td>
                                                        <td>${attendance.lateTimes}</td>
                                                        <td>${attendance.leaveEarlyTimes}</td>
                                                        <td>${attendance.completionTimes}</td>
                                                        <td>${attendance.leaveTimes}</td>
                                                        <td>${attendance.overtimeHours}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                                <tfoot>
                                                <tr><th rowspan="1" colspan="1">姓名</th>
                                                    <th rowspan="1" colspan="1">迟到</th>
                                                    <th rowspan="1" colspan="1">早退</th>
                                                    <th rowspan="1" colspan="1">旷工</th>
                                                    <th rowspan="1" colspan="1">请假</th>
                                                    <th rowspan="1" colspan="1">加班小时</th></tr>
                                                </tfoot>
                                            </table></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2">

                </div>
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
        var year = $("#year :selected").val();
        var month = $("#month :selected").val();
        $('.dataTables-example').DataTable({
            pageLength: 10,
            responsive: true,
            dom: '<"html5buttons"B>lTfgitp',
            buttons: [
                { extend: 'copy'},
                {extend: 'csv'},
                {extend: 'excel', title: year+'年'+month+'月考勤信息表'},
                {extend: 'pdf', title:  year+'年'+month+'月考勤信息表'},

                {extend: 'print',
                    customize: function (win){
                        $(win.document.body).addClass('white-bg');
                        $(win.document.body).css('font-size', '10px');

                        $(win.document.body).find('table')
                            .addClass('compact')
                            .css('font-size', 'inherit');
                    }
                }
            ]
        });
    });
</script>

<script>
    function getAttend() {
        var year = $("#year :selected").val();
        var month = $("#month :selected").val();
        window.location.href = "assess/searchAttendance?effectDate=" + year + "-" + month + "-01&endDate=" + year + "-" + month + "-28";
    }
</script>

</body>



</html>
