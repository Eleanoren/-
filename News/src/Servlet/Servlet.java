package Servlet;

import sql.JdbcCRUDByPreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Servlet")
public class Servlet extends HttpServlet {
    private static final long serialVersionUID=1;
    public Servlet(){}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String id=request.getParameter("id");
        String password=request.getParameter("password");
        String result;
        if ((id == "") || (id == null) || (id.length() > 20)) {
            try {
                result="请输入的用户名（不能超过20个字符）";
                request.setAttribute("massage",result);
                response.sendRedirect("/index.jsp");
            }catch (Exception e)
            {
                e.printStackTrace();
            }
        }
        if ((password == "") || (password == null) || (password.length() > 20)) {
            try {
                result = "请输入密码(不能超过20个字符)！";
                request.setAttribute("message", result);
                response.sendRedirect("/login.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        String strsql = "select * from userInfo where username='" + id + "' and userpsw= '" + password + "'";
        JdbcCRUDByPreparedStatement ps = new JdbcCRUDByPreparedStatement();
        List<Map<String, Object>> list = ps.find(strsql);

        HttpSession session = request.getSession();
        session.setAttribute("username", id);
        String k1, m1;
        if (!list.isEmpty()) {
            for (Map<String, Object> m : list) {
                for (String k : m.keySet()) {
                    k1 = k;
                    m1 = String.valueOf(m.get(k));
                    session.setAttribute(k1, m1);
                }
            }
            response.sendRedirect("/NewsView.jsp");

        } else {
            session.setAttribute("message", "用户名或密码不匹配！");

        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
