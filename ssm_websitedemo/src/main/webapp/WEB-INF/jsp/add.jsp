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
    <title>添加新闻</title>
</head>
<body>
<div align="center">
    <h1>添加新闻</h1>
    <form method="post" action="AddServlet">
        标题: <input type="text" name="title"/>
        <br/>
        <br/>
        作者: <input type="text" name="author"/>
        <br/>
        <br/>
        内容：<input type="text" name="content">
        <br/>
        <br/>
        <button type="submit">提交</button>

    </form>
</div>
</body>
</html>
