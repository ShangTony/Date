package edu.graduation.controller;

import edu.graduation.bean.Dating;
import edu.graduation.bean.User;
import edu.graduation.bean.UserJoinDate;
import edu.graduation.service.createDatingService;
import edu.graduation.service.messageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Tony on 16/5/10.
 */
@Controller
@RequestMapping(value = "/")
public class DateListController {
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

    @RequestMapping(value = "/ShowDateList",method = RequestMethod.GET)
    public String ShowDateList(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        int id=user.getId();
        List<User> user1=CreateDatingService.UserDateList(id);
        List<Dating> dateList=user1.get(0).getDatingList();
        request.getSession().setAttribute("dateList",dateList);
        return "My4";
    }

    @RequestMapping(value = "/deleteDate",method = RequestMethod.GET)
    public String deleteDate(@RequestParam("dateID")Integer dateID,HttpServletRequest request){               //约会ID
        CreateDatingService.deleteDate(dateID);
        User user=(User)request.getSession().getAttribute("user");
        int id=user.getId();
        List<User> user1=CreateDatingService.UserDateList(id);
        List<Dating> dateList=user1.get(0).getDatingList();
        request.getSession().setAttribute("dateList", dateList);
        return "My4";
    }

    @RequestMapping(value = "/showJoinDate",method = RequestMethod.GET)
    public String showJoinDate(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        UserJoinDate joinDate=new UserJoinDate();
        joinDate.setUserId(user.getId());
        List<UserJoinDate> joinDateList=MessageService.showJoinDate(joinDate);
        List<Dating> dateList=new ArrayList<Dating>();
        for(int i=0;i<joinDateList.size();i++){
            dateList.add(joinDateList.get(i).getDatingList().get(0));
        }
        request.getSession().setAttribute("dateList",dateList);
        return "My5";
    }

    @RequestMapping(value = "/deleteJoinDate",method = RequestMethod.GET)
    public String deleteJoinDate(@RequestParam("dateID")Integer dateID,HttpServletRequest request){               //约会ID
        CreateDatingService.deleteDate(dateID);
        User user=(User)request.getSession().getAttribute("user");
        UserJoinDate joinDate=new UserJoinDate();
        joinDate.setUserId(user.getId());
        List<UserJoinDate> joinDateList=MessageService.showJoinDate(joinDate);
        List<Dating> dateList=new ArrayList<Dating>();
        for(int i=0;i<joinDateList.size();i++){
            dateList.add(joinDateList.get(i).getDatingList().get(0));
        }
        request.getSession().setAttribute("dateList",dateList);
        return "My5";
    }

    @RequestMapping(value = "/ShowAuthorDate",method = RequestMethod.GET)
    public String ShowAuthorDate(@RequestParam("AuthorId")int id,HttpServletRequest request){
        List<User> user1=CreateDatingService.UserDateList(id);
        List<Dating> dateList=user1.get(0).getDatingList();
        request.setAttribute("Author",user1.get(0));
        request.getSession().setAttribute("dateList",dateList);
        return "userShow";
    }
}
