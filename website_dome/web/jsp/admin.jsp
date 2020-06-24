<%--
  Created by IntelliJ IDEA.
  User: sleeper Sabrina
  Date: 2020/6/24
  Time: 19:25
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
    <title>查看图书</title>
    <style type="text/css">
        h1{
            text-align: center;
        }
        body{
            background-color: antiquewhite;
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

<%
    // 设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");
    News news=new News();
    // 获取上一个页面传过来的值
    String title=request.getParameter("title");
    news.setTitle(title);
    NewsServiceImpl service = new NewsServiceImpl();
    List<News> list = service.select(news);

%>
<h1>新闻列表</h1>
<div id="before">
    <form action="admin.jsp" method="post">
        请输入姓名：<input type="text" name="title" placeholder="输入新闻名称搜索">
        <input type="submit" value="查询" />
    </form>
    <a href="javascript: window.history.go(-1)">返回上一级</a>
</div>
<table align="center" cellpadding="10" cellspacing="10">
    <tr bgcolor="green">
        <td>编号</td>
        <td>标题</td>
        <td>来源</td>
        <td>作者</td>
        <td>操作图书</td>
    </tr>
    <%
        String bg = null;
        for (int i = 0;i<list.size();i++){
            News b =list.get(i);
            if(i%2 == 0){
                bg = "pink";
            }else{
                bg = "yellow";
            }

    %>
    <tr bgcolor="<%=bg%>">
        <td><%=b.getId()%></td>
        <td><a href="admin_do_info.jsp?bookid=<%=b.getId()%>"><%=b.getTitle()%></a></td>
        <td><%=b.getTitle() %></td>
        <td><%=b.getSource() %></td>
        <td><%=b.getAuthor() %></td>
        <td>
            <a href="admin_update.jsp?bookid=<%=b.getId()%>">修改</a>
            <a href="admin_delete.jsp?bookid=<%=b.getId()%>">删除</a>
        </td>
    </tr>
    <%
        }
    %>

</table>
<table align="center">
    <tr>
        <td><a href="admin_addbook.jsp">新增新闻</a></td>
    </tr>
</table>

</body>

</html>
