package edu.graduation.dao;

import edu.graduation.bean.Dating;
import edu.graduation.bean.Message;
import edu.graduation.bean.User;
import edu.graduation.bean.UserJoinDate;
import edu.graduation.db.DBAccess;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Tony on 16/5/8.
 */
public class MessageDao {
    public void insertMessage(Message message) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            sqlSession.insert("Message.insertMessage", message);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }
    public List<UserJoinDate> showJoinDate(UserJoinDate JoinDate) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        List<UserJoinDate> joinDateList=new ArrayList<UserJoinDate>();
        try {
            sqlSession = dbAccess.getSqlSession();
            joinDateList=sqlSession.selectList("Join.showJoinDate", JoinDate);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return joinDateList;
    }

    public List<Dating> showCategory(Dating dating) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        List<Dating> DatingList=new ArrayList<Dating>();
        try {
            sqlSession = dbAccess.getSqlSession();
            DatingList=sqlSession.selectList("Dating.selectCategory", dating);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return DatingList;
    }

    public UserJoinDate showJoinNum(UserJoinDate JoinDate) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        UserJoinDate joinDate1=new UserJoinDate();
        try {
            sqlSession = dbAccess.getSqlSession();
            joinDate1=sqlSession.selectOne("Join.JoinNumber", JoinDate);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return joinDate1;
    }

    public void updateNum(Dating dating) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            sqlSession.update("Dating.updateNum", dating);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public User showAuthor(User user) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        User user1=new User();
        try {
            sqlSession = dbAccess.getSqlSession();
            user1=sqlSession.selectOne("Login.showAuthorInfo", user);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return user1;
    }



}
