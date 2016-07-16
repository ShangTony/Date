package edu.graduation.service;

import edu.graduation.bean.User;
import edu.graduation.bean.UserJoinDate;
import org.springframework.stereotype.Service;

/**
 * Created by Tony on 16/5/11.
 */
@Service
public interface modifyUserService {
    void modifyUser(User user);
    void joinDate(UserJoinDate join);
    UserJoinDate joinValid(UserJoinDate join);
    void quitDate(UserJoinDate join);
    }
