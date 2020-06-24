<%--
  Created by IntelliJ IDEA.
  User: sleeper Sabrina
  Date: 2020/6/24
  Time: 23:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.dean.News" %>
<%@ page import="java.dean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.dao.NewsServiceImpl" %>
<%@ page import="java.dao.NewsDaolmpl" %>
<%@ page import="java.dao.NewsDao" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>处理修改图书</title>
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

    Integer id=Integer.parseInt(request.getParameter("id"));

    String title = request.getParameter("title");
    String source=request.getParameter("source");
    String author=request.getParameter("author");
    String content=request.getParameter("content");

    //引入数据交互层
    NewsDao dao=new NewsDaoImpl();
    News news=new News();
    news = dao.getNews(id);

    news.setTitle(title);
    news.setSource(source);
    news.setAuthor(author);
    news.setContent(content);

    System.out.println("修改的新闻信息");
    System.out.println(news);

    boolean flag=dao.updateNews(news);


    if(flag){
        response.sendRedirect("admin.jsp");
    }else{
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
