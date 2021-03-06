<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<head>
    <title>修改权限</title>
</head>
<body>
<h1 class="title clearfix" class="title clearfix"><span class="fl">权限管理</span> <span class="point">·</span> <span
        class="fl">权限修改</span></h1>
<div class="formAdd">
    <form:form method="post" action="fun/update" modelAttribute="rout" id="funForm">
        <h3 class="tit">填写权限信息<span>（*为必填项）</span></h3>
        <form:hidden path="id"/>
        <div class="row3 clearfix">
            <div class="list">
                <label for="name">名称:</label>
                <form:input class="easyui-validatebox" type="text" placeholder="请输入角色名称" path="name"
                            data-options="required:true"/>
                <span>*</span>
            </div>
        </div>
        <div class="row3 clearfix">
            <div class="list">
                <label for="grade">等级:</label>
                <form:select path="grade" id="grade" class="easyui-validatebox easyui-combobox">
                    <form:option value="A">一级</form:option>
                    <form:option value="B">二级</form:option>
                    <form:option value="C">三级</form:option>
                </form:select>
                <span>*</span>
            </div>
        </div>
        <div class="row3 clearfix">
            <div class="list">
                <label for="parentId">父级:</label>
                <select id="parentId" name="parentId" class="easyui-validatebox easyui-combobox">
                    <c:forEach items="${selectParents}" var="selectParent">
                        <option value="${selectParent.id}" ${selectParent.select?"selected":""}>${selectParent.name}</option>
                    </c:forEach>
                </select>
                <span>*</span>
            </div>
        </div>
        <div class="row3 clearfix">
            <div class="list">
                <label for="uri">URL:</label>
                <form:input class="easyui-validatebox" type="text" placeholder="请输入URL" path="uri"
                            data-options="required:true"/>
                <span>*</span>
            </div>
        </div>
        <div class="row3 clearfix">
            <div class="list">
                <label for="code">权限码:</label>
                <form:input class="easyui-validatebox" type="text" placeholder="请输入权限码" path="code"
                            data-options="required:true"/>
                <span>*</span>
            </div>
        </div>
        <div class="row3 clearfix">
            <div class="list">
                <label for="orderBy">排序:</label>
                <form:input class="easyui-validatebox" type="text" placeholder="请输入排序" path="orderBy"
                            data-options="required:true"/>
                <span>*</span>
            </div>
        </div>
        <div class="row3 clearfix">
            <div class="list btList">
                <label for="name">状态:</label>
                <form:radiobutton id="open" path="status" value="O"/>
                <label class="bt" for="open" style="width: 67px">启用</label>
                <form:radiobutton id="close" path="status" value="C"/>
                <label class="bt" for="close" style="width: 67px">关闭</label>
            </div>
        </div>
        <div class="row3 clearfix">
            <div class="list btList">
                <label for="name">类型:</label>
                <form:radiobutton id="yunyin" path="type" value="0" checked="true"/>
                <label class="bt" for="yunyin" style="width: 67px">运营</label>
                <form:radiobutton id="huoban" path="type" value="1"/>
                <label class="bt" for="huoban" style="width: 67px">伙伴</label>
            </div>
        </div>
    </form:form>
    <a style="margin:30px 0 0 100px" class="commitForm" onclick="_save()">确认修改</a>
</div>
<script>
    $("#grade").combobox({
        onChange: function () {
            var curValue = $('#grade').combobox('getValue');
            var uri = "fun/searchparent/" + curValue;
            $("#parentId").combobox("reload", uri);
        }
    });

    var option = {
        valueField: 'id',
        textField: 'name',
        onLoadSuccess: function () {
            var types = $("#parentId").combobox('getData');
//            if (types.length > 0) {
//                $("#parentId").combobox('select', types[0].id);  //默认选择一个
//            }
        }
    }
    $("#parentId").combobox(option);

    function _save() {
        $("#funForm").submit();
    }

    $("#funForm").submit(function (e) {
        e.preventDefault();
        var options = {
            success: showResponse,
            resetForm: true
        };
        $(this).ajaxSubmit(options);
    });

    function showResponse(responseText, statusText) {
        if (responseText.statusCode == 200) {
            window.location.replace(document.referrer);
            layer.msg('成功');
        } else {
            layer.msg(responseText.message);
        }
    }
</script>
</body>
</html>
