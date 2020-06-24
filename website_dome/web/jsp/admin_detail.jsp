<%--
  Created by IntelliJ IDEA.
  User: sleeper Sabrina
  Date: 2020/6/24
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.dean.News" %>
<%@ page import="java.dean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.dao.NewsServiceImpl" %>
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
    <title>新闻详情</title>
    <style type="text/css">
        h1{
            text-align: center;
        }
        body{
            background-color: antiquewhite;
        }
        a{
            text-align:center;font-size: 24px;text-decoration: none;
        }
        a:hover{
            text-decoration: underline;font-size: 20px;
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


<h1>图书详情</h1>
<div id="before">
    <a href="javascript: window.history.go(-1)">返回上一级</a>
</div>
<%
    News news = (News) session.getAttribute("news");
%>
<table align="center" cellpadding="20" cellspacing="20">
    <tr style="font-size: 20px">
        <td>新闻编号</td>
        <td>新闻标题</td>
        <td>新闻来源</td>
        <td>新闻作者</td>
        <td>发布时间</td>
        <td>内容</td>
    </tr>
    <tr>
        <td><%=news.getId()%></td>
        <td><%=news.getTitle()%></td>
        <td><%=news.getSource()%></td>
        <td><%=news.getAuthor()%></td>
        <td><%=news.getTime()%></td>
        <td><%=news.getContent()%></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
    </tr>
</table>
<div style="text-align:center;font-size: 36px;">
    <a href="admin.jsp">新闻列表</a>
</div>
</body>
</html>
