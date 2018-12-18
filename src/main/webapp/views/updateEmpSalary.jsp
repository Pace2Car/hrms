<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  TechCategory: Haoge
  Date: 2018/12/10
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
        &times;
    </button>
    <h4 class="modal-title" id="myModalLabel">
        调整员工基本工资
    </h4>
</div>
<div class="modal-body text-center">
    <form class="form-horizontal" role="form" id="updateForm">
        <input type="hidden" name="empNo" value="${oldEmployee.empNo}">
        <div class="form-inline">
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 110px;">员工编号：</div>
                    <input style="width: 300px" type="text" class="form-control" id="empNo" value="${oldEmployee.empNo}"
                           name="" placeholder="" disabled="disabled">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">员工姓名：</div>
                    <input style="width: 300px" type="text" class="form-control" id="newName" value="${oldEmployee.empName}"
                           name="" placeholder="请输入员工姓名" disabled>
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">基本薪资：</div>
                    <input style="width: 300px" type="number" class="form-control" id="newSalary" value="${oldEmployee.baseSalary}"
                           name="aftersalary" placeholder="请输入员工薪资" >
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">调薪原因：</div>
                    <input style="width: 300px" type="text" class="form-control"
                           name="reason" placeholder="请输入调薪原因" >
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">备注：</div>
                    <input style="width: 300px" type="text" class="form-control"
                           name="remark" placeholder="（可留空）" >
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

<script>
    $(function () {
        $("#updateBtn").click(function () {
            var adjustsalary = $("#updateForm").serialize();
            $.post("salary/updateEmpSalary", adjustsalary, function (json) {
                $("#tr_" + $("#empNo").val() + " td:eq(2)").text($("#newSalary").val());
                console.dirxml($("#tr_" + $("#empNo").val())[0]);
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
    });
</script>
