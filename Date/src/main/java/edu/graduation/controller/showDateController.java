package edu.graduation.controller;

import edu.graduation.bean.Dating;
import edu.graduation.bean.Message;
import edu.graduation.bean.User;
import edu.graduation.bean.UserJoinDate;
import edu.graduation.service.createDatingService;
import edu.graduation.service.messageService;
import edu.graduation.service.modifyUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Tony on 16/5/8.
 */
@Controller
@RequestMapping(value = "/")
public class showDateController {
    private createDatingService CreateDatingService;
    @Autowired
    public void setCreateDatingService(createDatingService createDatingService) {
        CreateDatingService = createDatingService;
    }
    private messageService MessageService;
    @Autowired
    public void setMessageService(messageService messageService) {
        MessageService = messageService;
    }

    private modifyUserService ModifyUserService;
    @Autowired
    public void setModifyUserService(modifyUserService modifyUserService) {
        ModifyUserService = modifyUserService;
    }

    //************************************展示约会详细信息*************************
    @RequestMapping(value = "/show",method = RequestMethod.GET)
    public String showDate(@RequestParam("id")Integer id,Map<String,Object> model,HttpServletRequest req){
        User user1=(User)req.getSession().getAttribute("user");
        int dateId=id;
        int userId=user1.getId();
        UserJoinDate join=new UserJoinDate();
        UserJoinDate join1=new UserJoinDate();
        join.setDateId(dateId);
        join.setUserId(userId);
        join.setUserName(user1.getShowName());
        //*************************查询数据库此人是否参与过约会*********************************************
        join1=ModifyUserService.joinValid(join);
        if(join1==null){
            req.getSession().setAttribute("JoinValid",0);
        }else req.getSession().setAttribute("JoinValid",1);
        //**************************查询约会的人数***************************************************
        MessageService.showJoinNum(join);
        List<Dating> dating=CreateDatingService.showDateWithId(id);
        Dating dating1=new Dating();
        if(dating.get(0).getAuthorId()==userId){
            req.getSession().setAttribute("JoinValid", 2);
        }
        User author=new User();
        author.setId(dating.get(0).getAuthorId());
        User author1=MessageService.showAuthor(author);
        req.setAttribute("author",author1);
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
        req.setAttribute("messageList", message);
        //******************************获取数据库查询出来的关于留言者的信息***************************************************
        List<User> user=new ArrayList<User>();
        user=dating.get(0).getUserList();
        req.getSession().setAttribute("messageUser",user);
        req.getSession().setAttribute("dateId", id);
        model.put("dating", dating1);
        return "showDate";
    }

    @RequestMapping(value = "/joinDate",method=RequestMethod.GET)
    public String joinDate(HttpServletRequest request,Map<String,Object> model){
        User user=(User)request.getSession().getAttribute("user");
        int dateId=(Integer)request.getSession().getAttribute("dateId");
        int userId=user.getId();
        UserJoinDate join=new UserJoinDate();
        join.setDateId(dateId);
        join.setUserId(userId);
        join.setUserName(user.getShowName());
        ModifyUserService.joinDate(join);
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
        List<Message> message=dating.get(0).getMessageList();
        request.setAttribute("messageList", message);
        //******************************获取数据库查询出来的关于留言者的信息***************************************************
        List<User> userList=new ArrayList<User>();
        userList=dating.get(0).getUserList();
        request.getSession().setAttribute("messageUser",userList);
        request.getSession().setAttribute("dateId", dateId);
        model.put("dating", dating1);
        return "showDate";

    }

    @RequestMapping(value = "/quitDate",method=RequestMethod.GET)
    public String quitDate(HttpServletRequest request,Map<String,Object> model){
        User user1=(User)request.getSession().getAttribute("user");
        int dateId=(Integer)request.getSession().getAttribute("dateId");
        int userId=user1.getId();
        UserJoinDate join=new UserJoinDate();
        join.setDateId(dateId);
        join.setUserId(userId);
        join.setUserName(user1.getShowName());
        ModifyUserService.quitDate(join);

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
        List<Message> message=dating.get(0).getMessageList();
        request.setAttribute("messageList", message);
        //******************************获取数据库查询出来的关于留言者的信息***************************************************
        List<User> userList=dating.get(0).getUserList();
        request.getSession().setAttribute("messageUser",userList);
        //*********************************************************************************
        request.getSession().setAttribute("dateId", dateId);
        model.put("dating", dating1);
        return "showDate";



    }



}
