package cn.example.controller;

import cn.example.entity.News;
import cn.example.service.NewsServiceI;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet{
    NewsServiceI newsServiceI;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        News news=new News();
        news.setId(UUID.randomUUID().toString().replaceAll("-", ""));
        news.setTitle(request.getParameter("title"));
        news.setAuthor(request.getParameter("author"));
        news.setContent(request.getParameter("content"));
        newsServiceI.addNews(news);
        request.getRequestDispatcher("jsp/index.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void init() throws ServletException {
        //在Servlet初始化时获取Spring上下文对象(ApplicationContext)
        ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
        //从ApplicationContext中获取userService
        newsServiceI = (NewsServiceI) ac.getBean("NewsService");
    }

}
