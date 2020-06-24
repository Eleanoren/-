<%--
  Created by IntelliJ IDEA.
  User: sleeper Sabrina
  Date: 2020/6/24
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    // 获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath %>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户登录</title>
    <style type="text/css">
        h1{
            text-align: center;
        }
        h4{
            text-align: center;color: red;
        }
        body{
            background-color: antiquewhite;
        }
        a{
            text-decoration: none;font-size: 20px;color: black;
        }
        a:hover{
            text-decoration: underline;font-size: 24px;color: red;
        }
    </style>
</head>
<body>
<form action="info.jsp" method="post">
    <h1>用户登录</h1>
    <hr/>
    <table align="center">
        <tr>
            <td>账号：</td>
            <td><input type="text" name="name" id="name" placeholder="请输入您的账号" autofocus="autofocus"></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" name="password" id="password" placeholder="请输入您的密码"></td>
            <td><a href="searchPassword.jsp">找回密码</a></td>
        </tr>
        <tr>
            <td colspan="1">
            </td>
            <td>
                <input type="submit" value="登录"/>
                <input type="reset" value="重置"/>
                <a href="register.jsp" target="_blank">注册</a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>