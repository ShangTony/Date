package edu.graduation.dao;

import edu.graduation.bean.User;
import edu.graduation.bean.UserJoinDate;
import edu.graduation.db.DBAccess;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;

/**
 * Created by Tony on 16/4/17.
 */
public class LoginDao {

    public User Login(User user) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        User user1 = new User();
        try {
            sqlSession = dbAccess.getSqlSession();
            user1 = sqlSession.selectOne("Login.LoginMessage", user);

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return user1;
    }

    public User ApplyName(User user) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        User user1 = new User();
        try {
            sqlSession = dbAccess.getSqlSession();
            user1 = sqlSession.selectOne("Login.applyName", user);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return user1;
    }

    public User ApplyShowName(User user) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        User user1 = new User();
        try {
            sqlSession = dbAccess.getSqlSession();
            user1 = sqlSession.selectOne("Login.applyCall", user);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return user1;
    }
    public void InsertUser(User user) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            sqlSession.selectOne("Login.insertUser", user);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public void modifyUser(User user) {                 //修改用户信息
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            sqlSession.update("Login.modifyUser", user);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public void joinDate(UserJoinDate join) {                 //用户参加约会
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            sqlSession.insert("Join.insertJoin", join);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public UserJoinDate joinValid(UserJoinDate join) {                 //用户是否参与约会
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        UserJoinDate join1=new UserJoinDate();
        try {
            sqlSession = dbAccess.getSqlSession();
            join1=sqlSession.selectOne("Join.isValid", join);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return join1;
    }


    public void quitDate(UserJoinDate join) {                 //退出约会
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            sqlSession.delete("Join.deleteJoin", join);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }
}
