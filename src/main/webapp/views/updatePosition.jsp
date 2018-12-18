<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  course: Haoge
  Date: 2018/12/10
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
        &times;
    </button>
    <h4 class="modal-title" id="myModalLabel">
        更新职位信息
    </h4>
</div>
<div class="modal-body text-center">
    <form class="form-horizontal" role="form" id="updateForm">
        <input type="hidden" name="id" value="${oldPosition.id}">
        <div class="form-inline">
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 96px;">职位编号：</div>
                    <input style="width: 300px" type="number" class="form-control" id="deptNo" value="${oldPosition.id}"
                           name="" placeholder="" disabled="disabled">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 96px;">创建时间：</div>
                    <input style="width: 300px" type="text" class="form-control" id="createTime"
                           value="<fmt:formatDate value="${oldPosition.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                           name="" placeholder="" disabled="disabled">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 96px;">职位名称：</div>
                    <input style="width: 300px" type="text" class="form-control" id="newName" value="${oldPosition.posName}"
                           name="posName" placeholder="请输入职位">
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
            var position = $("#updateForm").serialize();
            $.post("position/updatePosition", position, function (json) {
                $("#tr_" + $("#posId").val() + " td:eq(1)").text($("#newName").val());
                console.dirxml($("#tr_" + $("#posId").val())[0]);
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
