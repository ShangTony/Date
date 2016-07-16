package edu.graduation.servlet;

import edu.graduation.bean.User;
import edu.graduation.service.LoginService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Tony on 16/4/16.
 */
public class LoginServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        /*
        * 接收页面传值
        * */
        String name=req.getParameter("name");
        String password=req.getParameter("password");
        /*
        * 查询列表
        * */
        LoginService loginService=new LoginService();
        User user=new User();
        user.setName(name);
        user.setPassword(password);
        User user1=loginService.Login(user);
        if(user1!=null){
            req.getSession().setAttribute("user",user1); //将user对象保存在session中
            resp.getWriter().write("success");//req.getRequestDispatcher("/WEB-INF/jsp/Main.jsp").forward(req,resp);
        }
        else {
            resp.getWriter().write("false");
        }
    }

}
