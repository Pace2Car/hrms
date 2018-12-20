<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  TechCategory: Haoge
  Date: 2018/12/20
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
        &times;
    </button>
    <h4 class="modal-title" id="myModalLabel">
        更新角色权限
    </h4>
</div>
<div class="modal-body text-center">
    <form class="form-horizontal" role="form" id="updateForm">
        <input type="hidden" name="id" id="rid" value="${oldRole.id}">
        <div class="form-inline">
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 110px;">角色全名：</div>
                    <input style="width: 300px" type="text" class="form-control" id="empNo" value="${oldRole.name}"
                           name="" placeholder="" disabled="disabled">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">角色简称：</div>
                    <input style="width: 300px" type="text" class="form-control" id="username" value="${oldRole.shortName}"
                           name="" placeholder="" disabled>
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md  text-left" style="border: 1px solid #91ffe4">
                    <div class="input-group-addon" style="width: 110px;">拥有权限：</div>
                    <div class="checkbox checkbox-info">
                        <c:forEach var="permission" items="${permissions}">
                            &nbsp;&nbsp;&nbsp;<input id="p_${permission.id}" type="checkbox" name="permissionList" value="${permission.id}">
                            <label for="p_${permission.id}">${permission.name}&nbsp;&nbsp;&nbsp;&nbsp;
                            </label>
                        </c:forEach>
                    </div>
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
        $.get("system/load_rolePermission?rid=" + $('#rid').val(),function (resp) {
            // console.dirxml(resp);
            //重新选中权限名
            $.each(resp, function (i, v) {
                console.dirxml(v.pid);
                console.dirxml("input:checkbox [value= '" + v.pid + "']");
                $("input[value= '"+ v.pid + "']").prop("checked", true);
            });
        },"json");

        $("#updateBtn").click(function () {
            var role = $("#updateForm").serialize();
            $.post("system/updateRole", role, function (json) {
                if (json.actionFlag) {
                    // $("#tr_" + $("#rid").val() + " td:eq(3)").text($("input [type='checkbox'] :checked").text());
                    $('#successAlert').slideDown();
                    setTimeout("$('#successAlert').fadeOut()", 3000);
                    setTimeout("location.replace('system/searchRole')", 200);
                } else {
                    $('#failAlert').slideDown();
                    setTimeout("$('#failAlert').fadeOut()", 3000);
                }
                $('#updateModal').modal("hide");
            },"json");

        });
    });
</script>
