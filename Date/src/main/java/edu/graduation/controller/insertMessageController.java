package edu.graduation.controller;

import edu.graduation.bean.Dating;
import edu.graduation.bean.Message;
import edu.graduation.bean.User;
import edu.graduation.bean.UserJoinDate;
import edu.graduation.service.createDatingService;
import edu.graduation.service.messageService;
import edu.graduation.service.modifyUserService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Tony on 16/5/8.
 */
@Controller
@RequestMapping(value = "/")
public class insertMessageController {
    private messageService MessageService;
    @Autowired
    public void setMessageService(messageService messageService) {
        MessageService = messageService;
    }
    private createDatingService CreateDatingService;
    @Autowired
    public void setCreateDatingService(createDatingService createDatingService) {
        CreateDatingService = createDatingService;
    }
    private modifyUserService ModifyUserService;
    @Autowired
    public void setModifyUserService(modifyUserService modifyUserService) {
        ModifyUserService = modifyUserService;
    }

    @RequestMapping(value = "/insertMessage",method = RequestMethod.GET)
    public String createDating(HttpServletRequest request,Map<String,Object> model) throws ParseException, IOException {     //@RequestParam("file")MultipartFile file,

        Message message1=new Message();
        User user=(User)request.getSession().getAttribute("user");
        int writeId=user.getId();                                     //从session中取用户ID
        int datingId=(Integer)request.getSession().getAttribute("dateId");                                //从session获取约会ID
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        String messageTime=sdf.format(date);                         //获取现在的时间并转换成字符串
        String content=request.getParameter("content");
        message1.setContent(content);
        message1.setDatingId(datingId);
        message1.setMessageTime(messageTime);
        message1.setWriteId(writeId);
        MessageService.insertMessage(message1);
        //*****************************以下为显示约会信息留言信息的操作************************************
        int dateId=(Integer)request.getSession().getAttribute("dateId");
        UserJoinDate join=new UserJoinDate();
        join.setDateId(dateId);
        join.setUserId(user.getId());
        join.setUserName(user.getShowName());
        //*****************判断是否参与过约会******************************************
        UserJoinDate join1=ModifyUserService.joinValid(join);
        if(join1==null){
            request.getSession().setAttribute("JoinValid",0);
        }else request.getSession().setAttribute("JoinValid",1);

        //****************************展示约会********
        MessageService.showJoinNum(join);
        List<Dating> dating=CreateDatingService.showDateWithId(dateId);
        Dating dating1=new Dating();
        User author=new User();
        author.setId(dating.get(0).getAuthorId());
        User author1=MessageService.showAuthor(author);
        request.setAttribute("author",author1);
        //********************************获取数据库查询出来的关于约会的信息*************
        dating1.setAuthorId(dating.get(0).getAuthorId());
        dating1.setName(dating.get(0).getName());
        dating1.setId(dating.get(0).getId());
        dating1.setDescription(dating.get(0).getDescription());
        dating1.setPhotoPath(dating.get(0).getPhotoPath());
        dating1.setNum(dating.get(0).getNum());
        dating1.setPlace(dating.get(0).getPlace());
        dating1.setTime(dating.get(0).getTime());
        //*******************************获取数据库查询出来的关于留言的信息*******************************
        List<Message> message=new ArrayList<Message>();
        message=dating.get(0).getMessageList();
        request.setAttribute("messageList", message);
        //******************************获取数据库查询出来的关于留言者的信息***************************************************
        List<User> userList=new ArrayList<User>();
        userList=dating.get(0).getUserList();
        request.getSession().setAttribute("messageUser",userList);
        //*********************************************************************************
        request.getSession().setAttribute("dateId", dateId);
        model.put("dating", dating1);
        return "showDate";
    }



}
