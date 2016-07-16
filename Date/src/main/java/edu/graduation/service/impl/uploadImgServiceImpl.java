package edu.graduation.service.impl;

import edu.graduation.bean.User;
import edu.graduation.dao.uploadImgDao;
import edu.graduation.service.uploadImgService;
import org.springframework.stereotype.Service;

/**
 * Created by Tony on 16/4/24.
 */
@Service("uploadImgService")
public class uploadImgServiceImpl implements uploadImgService {
    public void uploadUserImg(String imgPath,String name) {
        User user=new User();
        user.setImgPath(imgPath);
        user.setName(name);
        uploadImgDao UploadImgDao=new uploadImgDao();
         UploadImgDao.uploadUserImg(user);
    }

}
