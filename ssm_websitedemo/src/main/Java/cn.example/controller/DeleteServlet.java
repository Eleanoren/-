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

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

    NewsServiceI newsServiceI;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        newsServiceI.deleteByPrimaryKey(request.getParameter("id"));
        request.getRequestDispatcher("jsp/index.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    public void init() throws ServletException {
        //在Servlet初始化时获取Spring上下文对象(ApplicationContext)
        ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
        //从ApplicationContext中获取userService
        newsServiceI = (NewsServiceI) ac.getBean("NewsService");
    }
}
