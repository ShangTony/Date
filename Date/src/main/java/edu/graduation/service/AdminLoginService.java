package edu.graduation.service;

import edu.graduation.bean.Admin;
import edu.graduation.bean.Dating;
import edu.graduation.bean.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Tony on 16/5/14.
 */
@Service
public interface AdminLoginService {
    Admin adminLogin(Admin admin);
    List<User> checkUserList(User user) ;
    void deleteOneUser(String id) ;
     void deleteBatch(String[] ids);
     List<Dating> checkDateList(Dating dating);
     void deleteOneDate(String id) ;
     void deleteBatchDate(String[] ids);
    void makeValid(String id) ;






    }
