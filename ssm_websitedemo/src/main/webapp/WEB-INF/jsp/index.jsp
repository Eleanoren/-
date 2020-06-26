<%--
  Created by IntelliJ IDEA.
  User: sleeper Sabrina
  Date: 2020/6/26
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新闻列表</title>
    <style type="text/css">
        table,td{
            border: 1px solid;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <td>序号</td>
        <td>标题</td>
        <td>作者</td>
        <td>内容</td>
        <td colspan="2">操作</td>

    </tr>
    <%--遍历lstUsers集合中的User对象 --%>
    <c:forEach var="news" items="${newslist}">
        <tr>
            <td>${news.id}</td>
            <td>${news.title}</td>
            <td>${news.author}</td>
            <td>${news.coontent}</td>
            <td><a href="update.jsp?id=${news.id}&title=${news.title}&author=${news.author}&content=${new.content}">修改</a></td>
            <td><a href="DeleteServlet?id=${news.id}">删除</a></td>
        </tr>
    </c:forEach>
</table>
<a href="add.jsp">增加</a>
<a href="UserServlet">刷新</a>
</body>
</html>
