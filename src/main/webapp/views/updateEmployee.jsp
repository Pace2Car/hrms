<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  TechCategory: Haoge
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
        员工详细信息
    </h4>
</div>
<div class="modal-body text-center">
    <form class="form-horizontal" role="form" id="updateForm">
        <input type="hidden" id="upDeptNo" value="${oldEmployee.deptNo}">
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
                    <div class="input-group-addon" style="width: 110px;">部门名称：</div>
                    <select name="deptNo" id="updateDeptNo"
                            style="width: 300px"
                            class="form-control" placeholder="请选择部门名"
                            aria-controls="editable">
                    </select>
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">员工姓名：</div>
                    <input style="width: 300px" type="text" class="form-control" id="newName" value="${oldEmployee.empName}"
                           name="empName" placeholder="请输入员工姓名">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">性别：</div>
                    <select name="gender"
                            style="width: 300px"
                            class="form-control" placeholder=""
                            aria-controls="editable">
                        <option value="男" <c:if test="${oldEmployee.gender.equals('男')}">selected</c:if>>男</option>
                        <option value="女" <c:if test="${oldEmployee.gender.equals('女')}">selected</c:if>>女</option>
                    </select>
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">入职时间：</div>
                    <input style="width: 300px" type="text" class="form-control"
                           value="${oldEmployee.entryTime}"
                           name="entryTime" placeholder="请输入员工入职时间" disabled>
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">电话：</div>
                    <input style="width: 300px" type="text" class="form-control" value="${oldEmployee.telephone}"
                           name="telephone" placeholder="请输入员工电话">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">邮箱：</div>
                    <input style="width: 300px" type="text" class="form-control" value="${oldEmployee.email}"
                           name="email" placeholder="请输入员工邮箱">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">生日：</div>
                    <input style="width: 300px" type="date" class="form-control"
                           value="<fmt:formatDate value="${oldEmployee.birthday}" pattern="yyyy-MM-dd"/>"
                           name="birthday" placeholder="请输入员工生日">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">民族：</div>
                    <input style="width: 300px" type="text" class="form-control" value="${oldEmployee.ethnic}"
                           name="ethnic" placeholder="请输入员工民族">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">联系地址：</div>
                    <input style="width: 300px" type="text" class="form-control" value="${oldEmployee.address}"
                           name="address" placeholder="请输入员工联系地址">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">最高学历：</div>
                    <input style="width: 300px" type="text" class="form-control" value="${oldEmployee.education}"
                           name="education" placeholder="请输入员工最高学历">
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
        // 加载部门名下拉列表
        $.get("department/load_depts",function (resp) {
            // console.log(resp);
            $("#updateDeptNo").empty();
            // $("#updateDeptNo").append("<option value=''>不限--</option>");
            $.each(resp, function (i,v) {
                var option = new Option(v.deptName, v.deptNo);
                $("#updateDeptNo").append(option);
            });
            //重新选中部门名
            var upDeptNo = $('#upDeptNo').val();
            console.dirxml(upDeptNo);
            $('#updateDeptNo option[value="' + upDeptNo + '"]').prop("selected", true);
        },"json");

        $("#updateBtn").click(function () {
            var employee = $("#updateForm").serialize();
            $.post("employee/updateEmployee", employee, function (json) {
                $("#tr_" + $("#empNo").val() + " td:eq(1)").text($("#newName").val());
                $("#tr_" + $("#empNo").val() + " td:eq(2)").text($("#updateDeptNo :selected").val());
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
