package edu.graduation.service.impl;

import edu.graduation.bean.Dating;
import edu.graduation.bean.Message;
import edu.graduation.bean.User;
import edu.graduation.bean.UserJoinDate;
import edu.graduation.dao.MessageDao;
import edu.graduation.service.messageService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Tony on 16/5/8.
 */
@Service("messageService")
public class messageServiceImpl implements messageService {
    public void insertMessage(Message message) {
        MessageDao messageDao=new MessageDao();
        messageDao.insertMessage(message);
    }

    public List<UserJoinDate> showJoinDate(UserJoinDate JoinDate){
        MessageDao messageDao=new MessageDao();
        return messageDao.showJoinDate(JoinDate);
    }

    public UserJoinDate showJoinNum(UserJoinDate userJoinDate){
        MessageDao messageDao=new MessageDao();
        Dating dating=new Dating();
        UserJoinDate userJoinDate1=messageDao.showJoinNum(userJoinDate);
        dating.setNum(userJoinDate1.getNumber());
        dating.setId(userJoinDate1.getDateId());
        messageDao.updateNum(dating);
        return userJoinDate1;

    }

    public List<Dating> showCategory(Dating dating){
        MessageDao messageDao=new MessageDao();
        return messageDao.showCategory(dating);
    }

    public User showAuthor(User user){
        MessageDao messageDao=new MessageDao();
        return messageDao.showAuthor(user);
    }
}
