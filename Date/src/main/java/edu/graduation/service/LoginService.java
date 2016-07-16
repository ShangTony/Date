package edu.graduation.service;

import edu.graduation.bean.User;
import edu.graduation.dao.LoginDao;

/**
 * Created by Tony on 16/4/16.
 */
public class LoginService {
    public User Login(User user){
        LoginDao loginDao=new LoginDao();
        return loginDao.Login(user);
    }

    public User ApplyName(String name){
        User user=new User();
        user.setName(name);
        LoginDao loginDao=new LoginDao();
        return loginDao.ApplyName(user);
    }

    public User ApplyShowName(String showName){
        User user=new User();
        user.setShowName(showName);
        LoginDao loginDao=new LoginDao();
        return loginDao.ApplyShowName(user);
    }

    public void insertUser(String name,String password,String showName){
        User user=new User();
        user.setName(name);
        user.setShowName(showName);
        user.setPassword(password);
        LoginDao loginDao=new LoginDao();
        loginDao.InsertUser(user);

    }
}
