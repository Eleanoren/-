<%--
  Created by IntelliJ IDEA.
  User: sleeper Sabrina
  Date: 2020/6/24
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.dean.News" %>
<%@ page import="java.dean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.dao.NewsServiceImpl" %>
<%@ page import="java.dao.NewsDaolmpl" %>
<%@ page import="java.dao.NewsDao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>处理新增新闻</title>
    <style type="text/css">
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
<div id="head">
    <table width="100%">
        <td id="headWelLink">欢迎您：<%=user.getName()%></td>
        <td align="right" id="headLink">
            <a href="logout.jsp">安全退出</a>
        </td>
    </table>
</div>
<%
    }
%>

<%
    // 设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");
    News news=new News();
    String title=request.getParameter("title");
    int id= int.parseDouble(request.getParameter("id"));
    String author=request.getParameter("author");
    String source=request.getParameter("source");

    //获取admin_addbook.jsp页面提交的账号和密码设置到实体类User中
    news.setTitle(title);
    news.setId(id);
    news.setAuthor(author);
    news.setSource(source);

    System.out.println("添加的新闻信息");
    System.out.println(news);

    //引入数据交互层
    NewsDao dao=new NewsDaoImpl();
    boolean flag=dao.addNews(news);


    if(flag){
        response.sendRedirect("admin.jsp");
    }else{
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>