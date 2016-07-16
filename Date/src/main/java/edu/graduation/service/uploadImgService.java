package edu.graduation.service;

import edu.graduation.bean.User;
import org.springframework.stereotype.Service;

/**
 * Created by Tony on 16/4/24.
 */
@Service
public interface uploadImgService {

    void uploadUserImg(String imgPath,String name);
}
