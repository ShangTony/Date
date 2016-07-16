package edu.graduation.service.impl;

import edu.graduation.bean.User;
import edu.graduation.bean.UserJoinDate;
import edu.graduation.dao.LoginDao;
import edu.graduation.service.modifyUserService;
import org.springframework.stereotype.Service;

/**
 * Created by Tony on 16/5/12.
 */
@Service("modifyUserService")
public class modifyUserServiceImpl implements modifyUserService {
    public void modifyUser(User user) {
        LoginDao loginDao=new LoginDao();
        loginDao.modifyUser(user);
    }
    public void joinDate(UserJoinDate join) {
        LoginDao loginDao=new LoginDao();
        loginDao.joinDate(join);
    }

    public UserJoinDate joinValid(UserJoinDate join){
        LoginDao loginDao=new LoginDao();
        return loginDao.joinValid(join);
    }

    public void quitDate(UserJoinDate join){
        LoginDao loginDao=new LoginDao();
        loginDao.quitDate(join);
    }



}
