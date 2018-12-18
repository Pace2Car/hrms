<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        更新员工考核
    </h4>
</div>
<div class="modal-body text-center">
    <form class="form-horizontal" role="form" id="updateForm">
        <input type="hidden" name="id" id="appraiseId" value="${oldAppraise.id}">
        <input type="hidden" name="upStatus" id="upStatus" value="${oldAppraise.appStatus}">
        <div class="form-inline">
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 96px;">员工姓名：</div>
                    <input style="width: 300px" type="text" class="form-control" id="empName" value="${oldAppraise.empName}"
                           name="" placeholder="员工姓名" disabled="disabled">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 96px;">考评内容：</div>
                    <input style="width: 300px" type="text" class="form-control" value="${oldAppraise.appContent}"
                           name="appContent" id="newContent" placeholder="考评内容" />
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 96px;">考评日期：</div>
                    <input style="width: 300px" type="text" class="form-control" value="<fmt:formatDate value="${oldAppraise.appDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>"
                           name="" placeholder="" disabled>
                </div>
            </div>
            <br/><br/>
            <div class="input-group input-group-md">
                <div class="input-group-addon" style="width: 96px">是否通过：</div>
                <select name="appStatus" id="newAppStatus"
                        style="width: 300px"
                        class="form-control"
                        aria-controls="editable">
                    <option style="background-color: #c8ffab" value="1" selected> 合格</option>
                    <option style="background-color: #ff5100" value="0" > 不合格</option>
                </select>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 96px;">考评等级：</div>
                    <input style="width: 300px" type="text" class="form-control" value="${oldAppraise.appResult}"
                           name="appResult" id="newAppResult" placeholder="考评等级">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 96px;">备注：</div>
                    <input style="width: 300px" type="text" class="form-control" value="${oldAppraise.remark}"
                           name="remark" id="newRemark" placeholder="备注">
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
        //重新选中是否通过
        var upStatus = $('#upStatus').val();
        $('#newAppStatus option[value="' + upStatus + '"]').prop("selected", true);

        $("#updateBtn").click(function () {
            var appraise = $("#updateForm").serialize();
            $.post("assess/updateAppraise", appraise, function (json) {
                if (json.actionFlag) {
                    $("#tr_" + $("#appraiseId").val() + " td:eq(1)").text($("#newContent").val());
                    $("#tr_" + $("#appraiseId").val() + " td:eq(3)").text($("#newAppStatus :selected").text());
                    $("#tr_" + $("#appraiseId").val() + " td:eq(4)").text($("#newAppResult").val());
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
