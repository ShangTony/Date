package edu.graduation.dao;

import edu.graduation.bean.Dating;
import edu.graduation.bean.User;
import edu.graduation.db.DBAccess;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Tony on 16/5/3.
 */
public class createDatingDao {
    public void createDating(Dating dating){
        DBAccess dbAccess=new DBAccess();
        SqlSession sqlSession=null;
        try {
            sqlSession=dbAccess.getSqlSession();
            sqlSession.insert("Dating.insertDating", dating);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public Dating selectDateId(Dating dating){                          //插入一个约会后要查询约会ID
        DBAccess dbAccess=new DBAccess();
        SqlSession sqlSession=null;
        Dating date=new Dating();
        try {
            sqlSession=dbAccess.getSqlSession();
           date=sqlSession.selectOne("Dating.selectDateId", dating);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return date;
    }

    public void deleteDate(int id){
        DBAccess dbAccess=new DBAccess();
        SqlSession sqlSession=null;
        try {
            sqlSession=dbAccess.getSqlSession();
            sqlSession.delete("Dating.deleteOne", id);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public void deleteDateJoin(int id){
        DBAccess dbAccess=new DBAccess();
        SqlSession sqlSession=null;
        try {
            sqlSession=dbAccess.getSqlSession();
            sqlSession.delete("Join.deleteDateJoin", id);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public List<Dating> show(){                                     //主页显示8个约会
        DBAccess dbAccess=new DBAccess();
        List<Dating> dating=new ArrayList<Dating>();
        SqlSession sqlSession=null;
        try {
            sqlSession=dbAccess.getSqlSession();
            dating=sqlSession.selectList("Dating.showDateList");
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return dating;
    }

    public List<Dating> showDateWithId(int id){                      //点击约会图片获取约会信息并进入约会页面
        DBAccess dbAccess=new DBAccess();
        List<Dating> dating=new ArrayList<Dating>();
        Dating dating1=new Dating();
        dating1.setId(id);
        SqlSession sqlSession=null;
        try {
            sqlSession=dbAccess.getSqlSession();
            dating=sqlSession.selectList("Dating.showMessageList",dating1);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return dating;
    }

    public List<User> UserDateList(int id){
        DBAccess dbAccess=new DBAccess();
        List<User> user1=new ArrayList<User>();
        User user=new User();
        user.setId(id);
        SqlSession sqlSession=null;
        try {
            sqlSession=dbAccess.getSqlSession();
            user1=sqlSession.selectList("Login.userDateList", user);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return user1;
    }


    public List<Dating> placeSearch(Dating dating1){                                     //显示搜索地址结果
        DBAccess dbAccess=new DBAccess();
        List<Dating> dating=new ArrayList<Dating>();
        SqlSession sqlSession=null;
        try {
            sqlSession=dbAccess.getSqlSession();
            dating=sqlSession.selectList("Dating.placeSearch",dating1);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return dating;
    }

    public List<Dating> descriptionSearch(Dating dating1){                                     //显示搜索描述结果
        DBAccess dbAccess=new DBAccess();
        List<Dating> dating=new ArrayList<Dating>();
        SqlSession sqlSession=null;
        try {
            sqlSession=dbAccess.getSqlSession();
            dating=sqlSession.selectList("Dating.descriptionSearch",dating1);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return dating;
    }

    public List<Dating> timeSearch(Dating dating1){                                     //显示搜索时间结果
        DBAccess dbAccess=new DBAccess();
        List<Dating> dating=new ArrayList<Dating>();
        SqlSession sqlSession=null;
        try {
            sqlSession=dbAccess.getSqlSession();
            dating=sqlSession.selectList("Dating.timeSearch",dating1);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return dating;
    }



}
