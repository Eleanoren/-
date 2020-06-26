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
    <title>修改</title>
</head>
<body>

<%
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String content = request.getParameter("content");
%>

<div align="center">
    <h1>修改</h1>
    <form method="post" action="UpdateServlet">
        新闻序号: <input type="text" name="userId" value="<%=id%>" readonly="readonly"/>
        <br/>
        <br/>
        标题: <input type="text" name="userName" value="<%=title%>"/>
        <br/>
        <br/>
        作者: <input type="text" name="userBirthday" value="<%=author%>" readonly="readonly"/>
        <br/>
        <br/>
        内容: <input type="text" name="userSalary" value="<%=content%>"/>
        <br/>
        <br/>
        <button type="submit">提交</button>
    </form>
</div>

</body>
</html>
