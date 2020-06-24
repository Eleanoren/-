<%--
  Created by IntelliJ IDEA.
  User: sleeper Sabrina
  Date: 2020/6/24
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.dean.News" %>
<%@ page import="java.dean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.dao.NewsServiceImpl" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改图书</title>
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
    }
%>

<h1>修改图书</h1>
<hr/>
<%
    Integer id=Integer.parseInt(request.getParameter("id"));
    BookDao dao=new BookDaoImpl();
    News news=new News();
    news = dao.getBook(id);
%>
<form action="admin_do_updatebook.jsp" method="post" name="registerForm">
    <div>
        <tr>
            <input type="hidden" name="id" id="id" value="<%=news.getId()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>新闻标题：</label>
            <input type="text" name="title" id="title" value="<%=news.getTitle()%>" autofocus="autofocus">
        </tr>
    </div>
    <div>
        <tr>
            <label>新闻来源</label></td>
            <input type="text" name="source" id="source" value="<%=news.getSource()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>新闻作者：</label>
            <input type="text" name="author" id="author" value="<%=news.getAuthor()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>新闻内容：</label>
            <input type="text" name="content" id="content" value="<%=news.getContent()%>">
        </tr>
    </div>

    <div>
        <tr>
            <button type="submit" onclick="return checkForm()">修改</button>
            <button type="reset">重置</button>
        </tr>
    </div>
</form>

<script type="text/javascript">
    function checkForm() {
        var title = registerForm.title.value;
        var content = registerForm.content.value;
        //alert(name + pwd + repwd);
        if (title == "" || title == null) {
            alert("请输入新闻标题");
            registerForm.title.focus();
            return false;
        } else if (content == "" || content == null) {
            alert("请输入新闻内容");
            registerForm.content.focus();
            return false;
        }
        alert('修改成功！');
        return true;
    }
</script>
</body>
</html>
