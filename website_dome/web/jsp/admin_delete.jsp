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
    <title>删除新闻</title>
    <style type="text/css">
        #before{
            text-align: center;
        }
        body{
            background-color: antiquewhite;
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

    //获取admin.jsp页面的bookid
    Integer id=Integer.parseInt(request.getParameter("id"));


    //引入数据交互层
    BookDao dao=new BookDaoImpl();
    News news=new News();
    news = dao.getId(id);
    System.out.println("删除的新闻信息：");
    System.out.println(news);
    boolean flag=dao.deleteNews(id);

    if(flag){
        response.sendRedirect("admin.jsp");
    }else{
        response.sendRedirect("error.jsp");
    }
%>
</body>

</html>
