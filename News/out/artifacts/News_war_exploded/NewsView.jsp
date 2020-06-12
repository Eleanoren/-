<%--
  Created by IntelliJ IDEA.
  User: sleeper Sabrina
  Date: 2020/6/12
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新闻</title>
</head>
<body>
<%
    String id = (String) session.getAttribute("id");
    String password = (String) session.getAttribute("password");
    String title=(String) session.getAttribute("title");
    String content=(String) session.getAttribute("content");
    String source=(String) session.getAttribute("source");
    String time=(String) session.getAttribute("time");

%>
<div align="center">
    <%=id %>
    欢迎您，登陆成功！<br/>
    <font color="blue">新闻</font>
    <table border=1>
        <tr>
            <td>&nbsp;账号：&nbsp;</td>
            <td>&nbsp;&nbsp;<%=id %>&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;标题：&nbsp;</td>
            <td>&nbsp;&nbsp;<%=title %>&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;来源：&nbsp;</td>
            <td>&nbsp;&nbsp;<%=source %>&nbsp;kg&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;内容：&nbsp;</td>
            <td>&nbsp;&nbsp;<%=content %>&nbsp;&nbsp;</
            >
        </tr>
        <tr>
            <td>&nbsp;时间：&nbsp;</td>
            <td>&nbsp;&nbsp;<%=time %>&nbsp;&nbsp;</
            >
        </tr>
    </table>
    <a href="index.jsp">返回</a>
</div>
</body>
</html>
