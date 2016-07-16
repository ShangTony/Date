package edu.graduation.service;

import edu.graduation.bean.Dating;
import edu.graduation.bean.Message;
import edu.graduation.bean.User;
import edu.graduation.bean.UserJoinDate;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Tony on 16/5/8.
 */
@Service
public interface messageService {
    void insertMessage(Message message);
    List<UserJoinDate> showJoinDate(UserJoinDate JoinDate);
    UserJoinDate showJoinNum(UserJoinDate userJoinDate);
    List<Dating> showCategory(Dating dating);
    User showAuthor(User user);


    }
