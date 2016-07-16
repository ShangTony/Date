package edu.graduation.controller;

import edu.graduation.bean.Dating;
import edu.graduation.service.messageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by Tony on 16/5/15.
 */
@Controller
@RequestMapping(value = "/")
public class categoryShowController {
    private messageService MessageService;
    @Autowired
    public void setMessageService(messageService messageService) {
        MessageService = messageService;
    }
    @RequestMapping(value = "/showCategory",method = RequestMethod.GET)
    public String showCategory(@RequestParam("category")String category,HttpServletRequest request) throws UnsupportedEncodingException {
        //设置编码
        request.setCharacterEncoding("UTF-8");
        Dating dating=new Dating();
        dating.setCategory(category);
        List<Dating> datingList=MessageService.showCategory(dating);
        request.setAttribute("datingList",datingList);
        return "categoryShow";

    }
}
