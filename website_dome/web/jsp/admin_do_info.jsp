<%--
  Created by IntelliJ IDEA.
  User: sleeper Sabrina
  Date: 2020/6/24
  Time: 19:28
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath %>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新闻信息</title>
</head>
<body>
<%
    News news=new News();
    String sid = request.getParameter("id");
    Integer id = Integer.parseInt(sid);
    NewsService service = new BookServiceImpl();
    news.setId(id);
    News bookCur = service.getNews(news);
    // 控制台打印出类的信息（日志的前身）
    System.out.print("admin_do_info.jsp的信息-->");
    System.out.println(bookCur);
    session.setAttribute("news", bookCur);
    response.sendRedirect("admin_detail.jsp");
%>
</body>
</html>
