package edu.graduation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Tony on 16/5/14.
 */
@Controller
@RequestMapping(value = "/")
public class QuitController {
    @RequestMapping(value = "/quit")
    public String quit(HttpServletRequest request){
        request.getSession().invalidate();
        return "index";
    }
}
