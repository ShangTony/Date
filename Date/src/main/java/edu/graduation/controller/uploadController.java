package edu.graduation.controller;

import edu.graduation.bean.User;
import edu.graduation.service.uploadImgService;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
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

/**
 * Created by Tony on 16/4/24.
 */
@Controller
@RequestMapping(value = "/")
public class uploadController {
    private uploadImgService UploadImgService;
    @Autowired
    public void setUploadImgService (uploadImgService UploadImgService){this.UploadImgService=UploadImgService;}

    @RequestMapping(value ="/doUpload",method = RequestMethod.POST)
    public @ResponseBody User doUploadImg(@RequestParam("file")MultipartFile file,HttpServletRequest request) throws IOException {
     String timeMillis=Long.toString(System.currentTimeMillis());
        FileUtils.copyInputStreamToFile(file.getInputStream(), new File("/Users/Tony/Desktop/upLoadImg/resources/upLoad/userImg",timeMillis+file.getOriginalFilename()));
        String s = new String("resources/upLoad/userImg/" + timeMillis + file.getOriginalFilename());
        User user =(User)request.getSession().getAttribute("user");
        String name=user.getName();
        UploadImgService.uploadUserImg(s,name);
        user.setImgPath(s);
        request.getSession().setAttribute("user",user);
        //request.getSession().setAttribute("course",course);
        return user;
    }

}
