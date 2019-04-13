<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>第三天</title>
    <link href="${pageContext.request.contentType}/themes1.3.5/icon.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contentType}/themes1.3.5/default/easyui.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contentType}/js/jquery.min1.3.5.js"></script>
    <script type="text/javascript" src="${pageContext.request.contentType}/js/jquery.easyui.min1.3.5.js"></script>
    <script type="text/javascript" src="${pageContext.request.contentType}/js/easyui-lang-zh_CN1.3.5.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#t1").datagrid({
                url: "${pageContext.request.contextPath}/book/selectAll.do",
                queryParams: {
                    categoryId: '10'
                },
                toolbar: "#myBar",
                pagination: true,
                onDblClickRow: function (index, data) {
                    $("#updateDialog").dialog("open");
                    $("#bookName1").val(data.bookName);
                    $("#author1").val(data.author);
                    $("#bookid").val(data.bookId);
                },
                columns: [[
                    {checkbox: true},
                    {field: 'bookId', title: '编号', width: 80, align: "center"},
                    {field: 'bookName', title: '书名', width: 80, align: "center"},
                    {field: 'author', title: '作者', width: 80, align: "center"},
                    {
                        title: "操作", field: "cz", width: 80, align: "center", formatter: function (value, row, index) {
                            return "<a href='deleteOne?id=" + row.bookId + "' name='d1'>删除</a>"
                        }
                    }
                ]]

            })


            //定义添加dialog
            $("#addDialog").dialog({
                title: "添加图书",
                width: 400,
                height: 300,
                closed: true,
                buttons: "#addBook"
            })


            //定义添加dialog
            $("#updateDialog").dialog({
                title: "修改图书",
                width: 400,
                height: 300,
                closed: true,
                buttons: "#updateBook"
            })


            // 点击添加按钮
            $("#addBtn").click(function () {
                $("#addDialog").dialog("open")
            })

            // 点击删除选中按钮
            $("#deleteBtn").click(function () {
                var arr = $("#t1").datagrid("getSelections");
                if (arr.length == 0) {
                    alert("请至少选中一项！")
                } else {
                    var ids = new Array();
                    for (var i = 0; i < arr.length; i++) {
                        ids[i] = arr[i].bookId
                    }
                    var isDelete = confirm("确认删除？");
                    if (!isDelete) {
                        $("#t1").datagrid("load");
                    } else {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/book/deleteSelected.do",
                            data: "ids=" + ids,
                            type: "post",
                            success: function (data) {
                                if (data.status == "error") {
                                    alert("删除失败");
                                } else {
                                    $("#t1").datagrid("load");
                                }
                            }
                        })
                    }
                }
            })


            $("#addBook").click(function () {
                // 提交表单
                $("#f1").form("submit", {
                    url: "${pageContext.request.contextPath}/book/addBook.do",
                    onSubmit: function () {
                        // return $(this).form("validate");
                        return true;
                    },
                    success: function (data) {
                        data = JSON.parse(data)
                        if (data.status == "error") {
                            alert("添加失败！")
                        } else {
                            $("#addDialog").dialog("close");
                            $("#t1").datagrid("reload");
                        }
                    }
                })
            })


            $("#updateBook").click(function () {
                $("#f2").form("submit", {
                    url: "${pageContext.request.contextPath}/book/updateBook.do",
                    onSubmit: function () {
                        // return $(this).form("validate");
                        return true;
                    },
                    success: function (data) {
                        data = JSON.parse(data)
                        if (data.status == "error") {
                            alert("修改失败！")
                        } else {
                            $("#updateDialog").dialog("close");
                            $("#t1").datagrid("reload");
                        }
                    }
                })
            })

            // 条件搜索
            $("#sousuo").click(function () {
                var name = $("#bookName2").val();
                $("#t1").datagrid("load", {bookName: name, c_id: '10'})
            })


        })
    </script>
</head>
<body>

<%--book表格datagrid--%>
<table id="t1"></table>

<%--工具栏--%>
<div id="myBar">
    <a id="addBtn" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">添加</a>
    <a id="deleteBtn" href="javascript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">删除选中</a><br/>
    书名：<input type="text" name="bookName" id="bookName2"> <input type="button" value="搜索" id="sousuo"/>
</div>
<%--添加图书 框--%>
<div id="addDialog">
    <%--添加图书表单--%>
    <form id="f1" method="post">
        书名：<input id="bookName" name="bookName" type="text"/><br/>
        作者：<input id="author" name="author" type="text"/><br/>
    </form>
</div>
<%--添加图书 框--%>
<div id="updateDialog">
    <%--添加图书表单--%>
    <form id="f2" method="post">
        <input id="bookid" name="bookId" type="text" hidden="hidden"/>
        书名：<input id="bookName1" name="bookName" type="text"/><br/>
        作者：<input id="author1" name="author" type="text"/><br/>
    </form>
</div>
<%--添加图书按钮--%>
<div id="addBook">
    <a href="#" class="easyui-linkbutton">添加</a>
</div>
<%--添加图书按钮--%>
<div id="updateBook">
    <a href="#" class="easyui-linkbutton">修改</a>
</div>


</body>
</html>
