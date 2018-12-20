<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  TechCategory: Haoge
  Date: 2018/12/20
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
        &times;
    </button>
    <h4 class="modal-title" id="myModalLabel">
        更新用户信息
    </h4>
</div>
<div class="modal-body text-center">
    <form class="form-horizontal" role="form" id="updateForm">
        <input type="hidden" name="id" id="id" value="${oldUser.id}">
        <input type="hidden" id="rid" value="${oldUser.rid}">
        <div class="form-inline">
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 110px;">员工编号：</div>
                    <input style="width: 300px" type="text" class="form-control" id="empNo" value="${oldUser.empNo}"
                           name="" placeholder="" disabled="disabled">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">员工姓名：</div>
                    <input style="width: 300px" type="text" class="form-control" id="username" value="${oldUser.username}"
                           name="" placeholder="请输入员工姓名" disabled>
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">角色：</div>
                    <select name="rid" id="updateRid"
                            style="width: 300px"
                            class="form-control"
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
        // 加载职位名下拉列表
        $.get("system/load_roles",function (resp) {
            // console.log(resp);
            $("#updateRid").empty();
            // $("#newRid").append("<option value=''>-不限-</option>");
            $.each(resp, function (i,v) {
                var option = new Option(v.name, v.id);
                $("#updateRid").append(option);
            });
            //重新选中职位名
            var rid = $('#rid').val();
            console.dirxml(rid);
            $('#updateRid option[value="' + rid + '"]').prop("selected", true);
        },"json");

        $("#updateBtn").click(function () {
            var user = $("#updateForm").serialize();
            $.post("system/updateUser", user, function (json) {
                if (json.actionFlag) {
                    $("#tr_" + $("#id").val() + " td:eq(2)").text($("#updateRid :selected").text());
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
