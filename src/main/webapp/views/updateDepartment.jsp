<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  course: Haoge
  Date: 2018/12/7
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
        &times;
    </button>
    <h4 class="modal-title" id="myModalLabel">
        更新部门信息
    </h4>
</div>
<div class="modal-body text-center">
    <form class="form-horizontal" role="form" id="updateForm">
        <input type="hidden" id="upDeptNo" value="${oldDepartment.parentNo}">
        <input type="hidden" name="deptNo" value="${oldDepartment.deptNo}">
        <div class="form-inline">
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 96px;">部门编号：</div>
                    <input style="width: 300px" type="number" class="form-control" id="deptNo" value="${oldDepartment.deptNo}"
                           name="" placeholder="" disabled="disabled">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 96px;">部门名称：</div>
                    <input style="width: 300px" type="text" class="form-control" id="newName" value="${oldDepartment.deptName}"
                           name="deptName" placeholder="请输入部门名">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 96px;">上级部门：</div>
                    <select name="parentNo" id="newParent"
                            style="width: 300px"
                            class="form-control" placeholder="请选择上级部门名"
                            aria-controls="editable">
                    </select>
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
        // 加载上级部门名下拉列表
        $.get("department/load_depts",function (resp) {
            // console.log(resp);
            $("#newParent").empty();
            $("#newParent").append("<option value=''>--无上级部门--</option>");
            $.each(resp, function (i,v) {
                var option = new Option(v.deptName, v.deptNo);
                $("#newParent").append(option);
            });
            //重新选中上级部门名
            var upDeptNo = $('#upDeptNo').val();
            console.dirxml(upDeptNo);
            $('#newParent option[value="' + upDeptNo + '"]').prop("selected", true);
        },"json");

        $("#updateBtn").click(function () {
            var department = $("#updateForm").serialize();
            $.post("department/updateDepartment", department, function (json) {
                $("#tr_" + $("#deptNo").val() + " td:eq(1)").text($("#newName").val());
                console.dirxml($("#tr_" + $("#deptNo").val())[0]);
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
