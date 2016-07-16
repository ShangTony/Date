package edu.graduation.controller;

import edu.graduation.bean.User;
import edu.graduation.service.modifyUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Tony on 16/5/11.
 */
@Controller
@RequestMapping(value = "/")
public class modifyUser {
private modifyUserService ModifyUserService;
    @Autowired
    public void setModifyUserService(modifyUserService modifyUserService) {
        ModifyUserService = modifyUserService;
    }

    @RequestMapping(value = "/modifyUser",method = RequestMethod.GET)
    public String modifyUser(HttpServletRequest request){
        User user=new User();
        user=(User)request.getSession().getAttribute("user");
        user.setName(request.getParameter("name"));
        user.setShowName(request.getParameter("showName"));
        user.setBirthday(request.getParameter("birthday"));
        user.setSex(request.getParameter("sex"));
        ModifyUserService.modifyUser(user);
        request.getSession().setAttribute("user",user);
        return "test";
    }
}
