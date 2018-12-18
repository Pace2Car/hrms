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
        招聘详细信息
    </h4>
</div>
<div class="modal-body text-center">
    <form class="form-horizontal" role="form" id="updateForm">
        <input type="hidden" name="id" id="recruitId" value="${oldRecruit.id}">
        <input type="hidden" id="upPositionId" value="${oldRecruit.positionId}">
        <input type="hidden" id="upExperience" value="${oldRecruit.experience}">
        <input type="hidden" id="upEducation" value="${oldRecruit.education}">
        <div class="form-inline">
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 110px;">标题：</div>
                    <input style="width: 300px" type="text" class="form-control" value="${oldRecruit.title}"
                           name="title" placeholder="请输入标题">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 110px;">工作地点：</div>
                    <input style="width: 300px" type="text" id="newWorkPlace" class="form-control" value="<c:if test="${empty oldRecruit.workPlace}">不限</c:if>${oldRecruit.workPlace}"
                           name="workPlace" placeholder="请输入工作地点">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 110px;">薪资下限(k)：</div>
                    <input style="width: 300px" type="number" id="newMinSalary" class="form-control" value="${oldRecruit.minSalary}"
                           name="minSalary" placeholder="请输入薪资下限">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 110px;">薪资上限(k)：</div>
                    <input style="width: 300px" type="number" id="newMaxSalary" class="form-control" value="${oldRecruit.maxSalary}"
                           name="maxSalary" placeholder="请输入薪资上限">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 110px;">学历要求：</div>
                    <select name="education"
                            id="updateEducation"
                            style="width: 300px"
                            class="form-control"
                            aria-controls="editable">
                        <option value="不限" > 不限</option>
                        <option value="研究生及以上" > 研究生及以上</option>
                        <option value="本科" > 本科</option>
                        <option value="大专" > 大专</option>
                        <option value="高中及以下" > 高中及以下</option>
                    </select>
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 110px;">工作经验：</div>
                    <select name="experience"
                            id="updateExperience"
                            style="width: 300px"
                            class="form-control"
                            aria-controls="editable">
                        <option value="不限" > 不限</option>
                        <option value="10年以上" > 10年以上</option>
                        <option value="5-10年" > 5-10年</option>
                        <option value="3-5年" > 3-5年</option>
                        <option value="1-3年" > 1-3年</option>
                        <option value="应届生" > 应届生</option>
                    </select>
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md">
                    <div class="input-group-addon" style="width: 110px;">职位：</div>
                    <select name="positionId" id="updatePositionId"
                            style="width: 300px"
                            class="form-control"
                            aria-controls="editable">
                    </select>
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 110px;">需求人数：</div>
                    <input style="width: 300px" type="number" class="form-control" value="${oldRecruit.numberOfRecruit}"
                           name="numberOfRecruit" placeholder="请输入需求人数">
                </div>
            </div>
            <br/><br/>
            <div class="form-group">
                <div class="input-group input-group-md" style="margin-left: 3px">
                    <div class="input-group-addon" style="width: 110px;">需求描述：</div>
                    <textarea class="form-control" style="width: 300px;height: 200px;resize: none;"
                              name="description" placeholder="请输入详细描述及工作内容">
${oldRecruit.description}
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
        // 加载职位名下拉列表
        $.get("position/load_posis",function (resp) {
            // console.log(resp);
            $("#updatePositionId").empty();
            // $("#newDeptNo").append("<option value=''>不限--</option>");
            $.each(resp, function (i,v) {
                var option = new Option(v.posName, v.id);
                $("#updatePositionId").append(option);
            });
            //重新选中职位名
            var upPositionId = $('#upPositionId').val();
            // console.dirxml(upPositionId);
            $('#updatePositionId option[value="' + upPositionId + '"]').prop("selected", true);
            //重新选中工作经验
            var upExperience = $('#upExperience').val();
            // console.dirxml(upExperience);
            $('#updateExperience option[value="' + upExperience + '"]').prop("selected", true);
            //重新选中学历
            var upEducation = $('#upEducation').val();
            // console.dirxml(upEducation);
            $('#updateEducation option[value="' + upEducation + '"]').prop("selected", true);
        },"json");

        $("#updateBtn").click(function () {
            var recruitInfo = $("#updateForm").serialize();
            $.post("recruit/updateRecruit", recruitInfo, function (json) {
                if (json.actionFlag) {
                    var minSal = $("#newMinSalary").val();
                    var maxSal = $("#newMaxSalary").val();
                    $("#tr_" + $("#recruitId").val() + " td:eq(1)").text($("#newWorkPlace").val());
                    $("#tr_" + $("#recruitId").val() + " td:eq(2)").text($("#updatePositionId :selected").text());
                    if (minSal == 0 && maxSal == 0) {
                        $("#tr_" + $("#recruitId").val() + " td:eq(3)").text("面议");
                    } else if (minSal != 0 && maxSal == 0) {
                        $("#tr_" + $("#recruitId").val() + " td:eq(3)").text(minSal + 'k');
                    } else if (minSal == 0 && maxSal != 0) {
                        $("#tr_" + $("#recruitId").val() + " td:eq(3)").text(maxSal + 'k');
                    } else {
                        $("#tr_" + $("#recruitId").val() + " td:eq(3)").text(minSal + 'k-' + maxSal + 'k');
                    }
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
