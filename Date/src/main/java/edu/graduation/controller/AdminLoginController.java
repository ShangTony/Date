package edu.graduation.controller;

import edu.graduation.bean.Admin;
import edu.graduation.bean.Dating;
import edu.graduation.bean.User;
import edu.graduation.service.AdminLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by Tony on 16/5/14.
 */
@Controller
@RequestMapping(value = "/")
public class AdminLoginController {
    private AdminLoginService adminLoginService;
    @Autowired
    public void setAdminLoginService(AdminLoginService adminLoginService) {
        this.adminLoginService = adminLoginService;
    }

    @RequestMapping(value = "/adminLogin",method = RequestMethod.POST)
    public void adminLogin(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        Admin admin=new Admin();
        admin.setName(name);
        admin.setPassword(password);
        Admin admin1=adminLoginService.adminLogin(admin);
        if(admin1!=null){
            session.setAttribute("admin",admin1);
            response.getWriter().write("success");//req.getRequestDispatcher("/WEB-INF/jsp/Main.jsp").forward(req,resp);
        } else {
            response.getWriter().write("false");
        }
    }
    @RequestMapping(value="/showAdmin",method = RequestMethod.GET)
    public String showAdmin(HttpServletRequest request) throws UnsupportedEncodingException {
        //设置编码
        request.setCharacterEncoding("UTF-8");
        //接收页面的值
        String name=request.getParameter("name");
        String showName=request.getParameter("showName");
        //像页面传值
        request.setAttribute("name",name);
        request.setAttribute("showName",showName);
        User user=new User();
        user.setName(name);
        user.setShowName(showName);
        List<User> userList=adminLoginService.checkUserList(user);
        request.setAttribute("userList",userList);                    //把用户表信息传到界面
        return "manageUserList";
    }
    @RequestMapping(value="/deleteOne",method = RequestMethod.GET)
    public String deleteOne(HttpServletRequest request) throws UnsupportedEncodingException {
        //设置编码
        request.setCharacterEncoding("UTF-8");
        String id=request.getParameter("id");
        adminLoginService.deleteOneUser(id);
        //接收页面的值
        String name=request.getParameter("name");
        String showName=request.getParameter("showName");
        //像页面传值
        request.setAttribute("name",name);
        request.setAttribute("showName",showName);
        User user=new User();
        user.setName(name);
        user.setShowName(showName);
        List<User> userList=adminLoginService.checkUserList(user);
        request.setAttribute("userList",userList);                    //把用户表信息传到界面
        return "manageUserList";
    }
    @RequestMapping(value="/deleteBatch",method = RequestMethod.GET)
    public String deleteBatch(HttpServletRequest request) throws UnsupportedEncodingException {
        //设置编码
        request.setCharacterEncoding("UTF-8");
        String[] ids=request.getParameterValues("id");
        adminLoginService.deleteBatch(ids);
        //接收页面的值
        String name=request.getParameter("name");
        String showName=request.getParameter("showName");
        //像页面传值
        request.setAttribute("name",name);
        request.setAttribute("showName",showName);
        User user=new User();
        user.setName(name);
        user.setShowName(showName);
        List<User> userList=adminLoginService.checkUserList(user);
        request.setAttribute("userList",userList);                    //把用户表信息传到界面
        return "manageUserList";
    }

    @RequestMapping(value="/showDateList",method = RequestMethod.GET)
    public String showDateList(HttpServletRequest request) throws UnsupportedEncodingException {
        //设置编码
        request.setCharacterEncoding("UTF-8");
        //接收页面的值
        String name=request.getParameter("name");
        String place=request.getParameter("place");
        //像页面传值
        request.setAttribute("name", name);
        request.setAttribute("place", place);
        Dating dating=new Dating();
         dating.setName(name);
        dating.setPlace(place);
        List<Dating> dateList=adminLoginService.checkDateList(dating);
        request.setAttribute("dateList",dateList);                    //把约会表信息传到界面
        return "manageDateList";
    }

    @RequestMapping(value="/deleteOneDate",method = RequestMethod.GET)
    public String deleteOneDate(HttpServletRequest request) throws UnsupportedEncodingException {
        //设置编码
        request.setCharacterEncoding("UTF-8");
        String id=request.getParameter("id");
        adminLoginService.deleteOneDate(id);
        //接收页面的值
        String name=request.getParameter("name");
        String place=request.getParameter("place");
        //像页面传值
        request.setAttribute("name", name);
        request.setAttribute("place", place);
        Dating dating=new Dating();
        dating.setName(name);
        dating.setPlace(place);
        List<Dating> dateList=adminLoginService.checkDateList(dating);
        request.setAttribute("dateList",dateList);                    //把约会表信息传到界面
        return "manageDateList";
    }

    @RequestMapping(value="/deleteBatchDate",method = RequestMethod.GET)
    public String deleteBatchDate(HttpServletRequest request) throws UnsupportedEncodingException {
        //设置编码
        request.setCharacterEncoding("UTF-8");
        String[] ids=request.getParameterValues("id");
        adminLoginService.deleteBatchDate(ids);
        //接收页面的值
        String name=request.getParameter("name");
        String place=request.getParameter("place");
        //像页面传值
        request.setAttribute("name", name);
        request.setAttribute("place", place);
        Dating dating=new Dating();
        dating.setName(name);
        dating.setPlace(place);
        List<Dating> dateList=adminLoginService.checkDateList(dating);
        request.setAttribute("dateList",dateList);                    //把约会表信息传到界面
        return "manageDateList";
    }

    @RequestMapping(value="/makeValid",method = RequestMethod.GET)
    public String makeValid(HttpServletRequest request) throws UnsupportedEncodingException {
        //设置编码
        request.setCharacterEncoding("UTF-8");
        String id=request.getParameter("id");
        adminLoginService.makeValid(id);
        //接收页面的值
        String name=request.getParameter("name");
        String place=request.getParameter("place");
        //像页面传值
        request.setAttribute("name", name);
        request.setAttribute("place", place);
        Dating dating=new Dating();
        dating.setName(name);
        dating.setPlace(place);
        List<Dating> dateList=adminLoginService.checkDateList(dating);
        request.setAttribute("dateList",dateList);                    //把约会表信息传到界面
        return "manageDateList";
    }



}
