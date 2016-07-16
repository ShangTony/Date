package edu.graduation.controller;

import edu.graduation.bean.Dating;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Tony on 16/5/1.
 */
@Controller
@RequestMapping(value = "/")
public class createDatingController {
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

    private messageService MessageService;
    @Autowired
    public void setMessageService(messageService messageService) {
        MessageService = messageService;
    }

    @RequestMapping(value = "/createDating",method = RequestMethod.POST)
    public String createDating(@RequestParam("file")MultipartFile file,HttpServletRequest request) throws ParseException, IOException {     //@RequestParam("file")MultipartFile file,

        Dating dating=new Dating();
        Dating dating1=new Dating();
        User user=(User)request.getSession().getAttribute("user");
        int authorId=user.getId();                                     //从session中取用户ID
        String name=request.getParameter("name");                     //从前端取约会名字
        String time=request.getParameter("time");                     //从前端取约会时间
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Date date=sdf.parse(time);
        String place=request.getParameter("place");                  //从前端取约会地点
        String description=request.getParameter("description");      //从前端取约会描述
        String category=request.getParameter("category");
        String timeMillis=Long.toString(System.currentTimeMillis());
        FileUtils.copyInputStreamToFile(file.getInputStream(), new File("/Users/Tony/Desktop/upLoadImg/resources/upLoad/photo", timeMillis + file.getOriginalFilename()));
        String s = new String("resources/upLoad/photo/" + timeMillis + file.getOriginalFilename());
        dating.setName(name);
        dating.setTime(date);
        dating.setPlace(place);
        dating.setDescription(description);
        dating.setAuthorId(authorId);
        dating.setPhotoPath(s);
        dating.setCategory(category);
        CreateDatingService.createDating(dating);
        //********************************************
        UserJoinDate join=new UserJoinDate();
        join.setUserId(authorId);
        join.setUserName(user.getShowName());
        dating1=CreateDatingService.selectDateId(dating);
        join.setDateId(dating1.getId());
        ModifyUserService.joinDate(join);
        //*****************判断是否参与过约会******************************************
        UserJoinDate join1=ModifyUserService.joinValid(join);
        if(join1==null){
            request.getSession().setAttribute("JoinValid",0);
        }else request.getSession().setAttribute("JoinValid",1);
        MessageService.showJoinNum(join);
        List<Dating> datingList=CreateDatingService.showDateWithId(dating1.getId());
        if(datingList.get(0).getAuthorId()==user.getId()){
            request.getSession().setAttribute("JoinValid",2);
        }
        request.setAttribute("author",user);
        request.setAttribute("dating",dating1);
        request.getSession().setAttribute("dateId",dating1.getId());
        return "showDate";
    }
}
