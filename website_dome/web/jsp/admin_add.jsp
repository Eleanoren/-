<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: sleeper Sabrina
  Date: 2020/6/24
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.dean.News" %>
<%@ page import="java.dean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.dao.NewsServiceImpl" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新增新闻</title>
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
        div{
            text-align: center;
        }
        #before{
            text-align: center;
        }
        #head{
            background: #eeeeee;height: 80px;
        }
        #headLink{
            font-size: 20px;
        }
        #headWelLink{
            font-size: 20px;
        }
    </style>
</head>
<body>
<%--头部信息--%>
<%
    User user =(User)session.getAttribute("user");
    if(user == null){
        response.sendRedirect("login.jsp");
    }else {
%>

<table width="100%" id="head">
    <td id="headWelLink">欢迎您：<%=user.getName()%></td>
    <td align="right" id="headLink">
        <a href="logout.jsp">安全退出</a>
    </td>
</table>


<h1>新增新闻</h1>
<hr/>

<div id="before">
    <a href="javascript: window.history.go(-1)">返回上一级</a>
</div>
</br>

<form action="admin_do_add.jsp" method="post" name="registerForm">
    <div>
        <tr>
            <label>新闻标题：</label>
            <input type="text" name="title" id="title" placeholder="新闻标题" autofocus="autofocus">
        </tr>
    </div>
    <div>
        <tr>
            <label>新闻来源</label></td>
            <input type="text" name="source" id="source" placeholder="新闻来源">
        </tr>
    </div>
    <div>
        <tr>
            <label>新闻作者：</label>
            <input type="text" name="author" id="author" placeholder="新闻作者">
        </tr>
    </div>
    <div>
        <tr>
            <label>时间：</label>
            <input type="text" name="time" id="time" placeholder="时间">
        </tr>
    </div>
    <div>
        <tr>
            <label>内容</label>
            <input type="text" name="content" id="content" placeholder="内容">
        </tr>
    </div>

    <div id="submitbtn">
        <tr>
            <button type="submit" onclick="return checkForm()">添加</button>
            <button type="reset">重置</button>

        </tr>
    </div>
</form>

<script type="text/javascript">
    function checkForm() {
        var bookname = registerForm.bookname.value;
        var price = registerForm.price.value;
        //alert(name + pwd + repwd);
        if (bookname == "" || bookname == null) {
            alert("请输入新闻编号");
            registerForm.id.focus();
            return false;
        } else if (price == "" || price == null) {
            alert("请输入新闻标题");
            registerForm.title.focus();
            return false;
        }
        alert('添加成功！');
        return true;
    }
</script>
</body>
</html>