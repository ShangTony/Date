package edu.graduation.controller;

import edu.graduation.bean.Dating;
import edu.graduation.service.createDatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Tony on 16/5/12.
 */
@Controller
@RequestMapping(value = "/")
public class searchController {
    private createDatingService CreateDatingService;
    @Autowired
    public void setCreateDatingService(createDatingService createDatingService) {
        CreateDatingService = createDatingService;
    }

    @RequestMapping(value = "/placeSearch",method = RequestMethod.GET)
    public String placeSearch(HttpServletRequest request){
        Dating dating=new Dating();
        dating.setPlace(request.getParameter("place"));
        List<Dating> datingList=CreateDatingService.placeSearch(dating);
        request.setAttribute("datingList",datingList);
        return "search2";
    }

    @RequestMapping(value = "/descriptionSearch",method = RequestMethod.GET)
    public String descriptionSearch(HttpServletRequest request){
        Dating dating=new Dating();
        dating.setDescription(request.getParameter("description"));
        List<Dating> datingList=CreateDatingService.descriptionSearch(dating);
        request.setAttribute("datingList",datingList);
        return "search3";
    }

    @RequestMapping(value = "/timeSearch",method = RequestMethod.GET)
    public String timeSearch(HttpServletRequest request) throws ParseException {
        Dating dating=new Dating();
        Date date=new Date();
        String time=request.getParameter("time");
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        if(time!=null&&time!="") {
            date = sdf.parse(time);
        }
        dating.setTime(date);
        List<Dating> datingList=CreateDatingService.timeSearch(dating);
        request.setAttribute("datingList",datingList);
        return "search";
    }
}
