package edu.graduation.dao;

import edu.graduation.bean.Admin;
import edu.graduation.bean.Dating;
import edu.graduation.bean.User;
import edu.graduation.db.DBAccess;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Tony on 16/5/14.
 */
public class adminDao {
    public Admin Login(Admin admin) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        Admin admin1 = new Admin();
        try {
            sqlSession = dbAccess.getSqlSession();
            admin1 = sqlSession.selectOne("Admin.AdminLogin", admin);

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return admin1;
    }

        public List<User> checkUserList(User user) {
            DBAccess dbAccess = new DBAccess();
            SqlSession sqlSession = null;
            List<User> userList=new ArrayList<User>();
            try {
                sqlSession = dbAccess.getSqlSession();
                userList = sqlSession.selectList("Login.userList", user);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (sqlSession != null) {
                    sqlSession.close();
                }
            }
            return userList;
        }

    public List<Dating> checkDateList(Dating dating) {
            DBAccess dbAccess = new DBAccess();
            SqlSession sqlSession = null;
            List<Dating> dateList=new ArrayList<Dating>();
            try {
                sqlSession = dbAccess.getSqlSession();
                dateList = sqlSession.selectList("Dating.adminDateList", dating);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (sqlSession != null) {
                    sqlSession.close();
                }
            }
            return dateList;
        }

    public void deleteOneUser(int id) {
            DBAccess dbAccess = new DBAccess();
            SqlSession sqlSession = null;
            try {
                sqlSession = dbAccess.getSqlSession();
                sqlSession.selectList("Login.deleteOneUser", id);
                sqlSession.commit();

            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (sqlSession != null) {
                    sqlSession.close();
                }
            }
        }


    public void deleteOneDate(int id) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            sqlSession.selectList("Dating.deleteOneDate", id);
            sqlSession.commit();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public void deleteBatch(List<Integer> ids){
        DBAccess dbAccess=new DBAccess();
        SqlSession sqlSession=null;
        try {
            sqlSession=dbAccess.getSqlSession();
            sqlSession.delete("Login.deleteBatchUser", ids);
            //通过sqlSession执行SQL语句
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(sqlSession!=null){
                sqlSession.close();
            }
        }
    }

    public void deleteBatchDate(List<Integer> ids){
        DBAccess dbAccess=new DBAccess();
        SqlSession sqlSession=null;
        try {
            sqlSession=dbAccess.getSqlSession();
            sqlSession.delete("Dating.deleteBatchDate", ids);
            //通过sqlSession执行SQL语句
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(sqlSession!=null){
                sqlSession.close();
            }
        }
    }

    public void makeValid(int id){
        DBAccess dbAccess=new DBAccess();
        SqlSession sqlSession=null;
        try {
            sqlSession=dbAccess.getSqlSession();
            sqlSession.update("Dating.makeValid", id);
            //通过sqlSession执行SQL语句
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(sqlSession!=null){
                sqlSession.close();
            }
        }
    }
}
