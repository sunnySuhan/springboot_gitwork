<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="themes1.3.5/icon.css" rel="stylesheet" type="text/css"/>
    <link href="themes1.3.5/default/easyui.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery.min1.3.5.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min1.3.5.js"></script>
    <script type="text/javascript" src="js/easyui-lang-zh_CN1.3.5.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#t1").datagrid({
                url: "${pageContext.request.contextPath}/user/showAll",
                fitColumns: true,
                rownumbers: true,
                //singleSelect:true,
                toolbar: "#myBar",
                pagination: true,
                // onDblClickRow:function (index,data) {
                //     $("#updateDialog").dialog("open");
                //     $("#bookName1").val(data.bookName);
                //     $("#author1").val(data.author);
                //     $("#bookid").val(data.bookId);
                // },
                columns: [[
                    {checkbox: true},
                    {field: 'id', title: 'id', width: 80, align: "center", hidden: true},
                    {field: 'name', title: '姓名', width: 80, align: "center"},
                    {field: 'password', title: '密码', width: 80, align: "center"},
                    {
                        title: "操作", field: "cz", width: 80, align: "center",
                        formatter: function (value, row, index) {
                            return "<a href='deleteOne?id=" + row.id + "' name='d1'>删除</a>"
                        }
                    }
                ]]

            })
            $("#sousuo").click(function () {
                var name = $("#name").val();
                alert("aaaaaa")
                $("#t1").datagrid("load", {
                    name: name
                });
            })

            $("#deleteSelected").click(function () {
                var arr = $("#t1").datagrid("getSelections");

            })
        })
    </script>
</head>
<body>

<table id="t1"></table>
<div id="myBar">
    <div align="center" style="display: inline;float: right;width: 50%">
        请输入姓名：<input type="text" name="name" id="name"/>
        <input type="button" value="搜索" id="sousuo"/>
    </div>
    <div align="center" style="display: inline;float: left;width: 50%">
        <input type="button" value="添加" id="addBtn"/>
        <input type="button" value="批量删除" id="deleteSelected"/>
    </div>

</div>

</body>
</html>
