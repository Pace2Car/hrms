<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  TechCategory: Haoge
  Date: 2018/12/17
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
        &times;
    </button>
    <h4 class="modal-title" id="myModalLabel">
        重新申请
    </h4>
</div>
<div class="modal-body text-center">
    <form class="form-horizontal" role="form" id="updateForm">
        <input type="hidden" name="id" id="trainId" value="${oldTrain.id}">
        <div class="form-inline">
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">驳回原因：</div>
                    <input style="width: 300px" type="text" class="form-control" value="${oldTrain.refuseReason}"
                           name="subject" id="refuseReason" disabled>
                </div>
                <br/><br/>
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">主题：</div>
                    <input style="width: 300px" type="text" class="form-control" value="${oldTrain.subject}"
                           name="subject" id="newSubject" placeholder="请输入主题">
                </div>
                <br/><br/>
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">开始时间：</div>
                    <input style="width: 300px" type="date" class="form-control"
                           name="startTime" id="newStartTime" placeholder="请输入开始时间" value="<fmt:formatDate value="${oldTrain.startTime}" pattern="yyyy-MM-dd"></fmt:formatDate>" min="0">
                </div>
                <br/><br/>
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">结束时间：</div>
                    <input style="width: 300px" type="date" class="form-control"
                           name="endTime" id="newEndTime" placeholder="请输入结束时间" value="<fmt:formatDate value="${oldTrain.endTime}" pattern="yyyy-MM-dd"></fmt:formatDate>" min="0">
                </div>
                <br/><br/>
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px">预算：</div>
                    <input style="width: 300px" type="number" class="form-control"
                           name="budget" id="newBudget" placeholder="请输入需求预算" value="${oldTrain.budget}" min="0">
                </div>
                <br/><br/>
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 110px;">详细描述：</div>
                    <textarea style="width: 300px;height: 400px;resize: none" class="form-control" id="description"
                              name="description" placeholder="">
${oldTrain.description}
</textarea>
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
            var train = $("#updateForm").serialize();
            $.post("train/reApplyTrain", train, function (json) {
                $("#tr_" + $("#trainId").val() + " td:eq(0)").text($("#newSubject").val());
                $("#tr_" + $("#trainId").val() + " td:eq(1)").text($("#newStartTime").val());
                $("#tr_" + $("#trainId").val() + " td:eq(2)").text($("#newEndTime").val());
                $("#tr_" + $("#trainId").val() + " td:eq(3)").text($("#newBudget").val());
                $("#tr_" + $("#trainId").val() + " td:eq(4)").text("待处理");
                $("#btn_" + $("#trainId").val()).hide();
                if (json.actionFlag) {
                    $('#successAlert').slideDown();
                    setTimeout("$('#successAlert').fadeOut()", 3000);
                } else {
                    $('#failAlert').slideDown();
                    setTimeout("$('#failAlert').fadeOut()", 3000);
                }
                $('#detailModal').modal("hide");
            },"json");

        });
    });
</script>
