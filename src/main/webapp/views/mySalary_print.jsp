<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>打印工资明细</title>
    <link href="vendor/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">
</head>
<body class="white-bg">
<div class="wrapper wrapper-content p-xl">
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
                    <th style="font-size: 14px">工号</th>
                    <th style="font-size: 14px">姓名</th>
                    <th style="font-size: 14px">部门</th>
                    <th style="font-size: 14px">基本工资</th>
                    <th style="font-size: 14px">绩效奖金</th>
                    <th style="font-size: 14px">应扣工资</th>
                    <th style="font-size: 14px">合计</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td style="font-size: 14px">${mySalary.empNo}</td>
                    <td style="font-size: 14px">${mySalary.empName}</td>
                    <td style="font-size: 14px">${mySalary.deptName}</td>
                    <td style="font-size: 14px">￥${mySalary.baseSalary}</td>
                    <td style="font-size: 14px">￥${mySalary.bonus}</td>
                    <td style="font-size: 14px">￥${mySalary.mulct}</td>
                    <td style="font-size: 14px">￥${mySalary.baseSalary+mySalary.bonus-mySalary.mulct}</td>
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

        <div class="well m-t"><strong>注意：</strong>
            该工资明细为公司内部保密，仅供个人工资票据，不可与他人传看，否则公司将有权利
            依法解除劳动关系，不予补偿。
        </div>
    </div>
</div>

<!-- Mainly scripts -->
<script src="js/jquery-2.2.4.js"></script>
<script src="js/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="vendor/js/plugins/metisMenu/jquery.metisMenu.js"></script>

<!-- Custom and plugin javascript -->
<script src="js/inspinia.js"></script>

<script type="text/javascript">
    window.print();
    window.close();
</script>

</body>

</html>
