package edu.graduation.servlet;

import edu.graduation.service.LoginService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Tony on 16/4/19.
 */
public class ApplyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String ApplyName = req.getParameter("name");
        String ApplyShowName = req.getParameter("showName");
        String ApplyPassword=req.getParameter("password");
        boolean flag=false;
        if(ApplyName!=null&&ApplyPassword!=null&&ApplyPassword!=null)
            flag=true;

        LoginService loginService = new LoginService();
        if (ApplyName != null) {                                             //ajax传来判断用户名
            if (ApplyName.length() < 4)
                resp.getWriter().write("Short");
            else if (loginService.ApplyName(ApplyName) != null) {
                resp.getWriter().write("false");
            } else if(flag==false)
                resp.getWriter().write("success");
        }if(ApplyShowName!=null){                                       //ajax传来判断昵称
            if(ApplyShowName.length()==0)
                resp.getWriter().write("Short");
            else if (loginService.ApplyShowName(ApplyShowName) != null) {
                resp.getWriter().write("false");
            } else if(flag==false)
                resp.getWriter().write("success");
        }
         if(ApplyPassword!=null){                                         //ajax传来判断密码
            if(ApplyPassword.length()<6)
                resp.getWriter().write("Short");
            else if(flag==false)
                resp.getWriter().write("success");
        }if(flag==true){                                                                //注册账号，把申请信息写进数据库
            loginService.insertUser(ApplyName,ApplyPassword,ApplyShowName);
            resp.getWriter().write("success");
        }
    }

    }

