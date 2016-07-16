package edu.graduation.dao;

import edu.graduation.bean.User;
import edu.graduation.db.DBAccess;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import java.io.IOException;

/**
 * Created by Tony on 16/4/24.
 */
public class uploadImgDao {

    public User uploadUserImg(User user){
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        User user1 = new User();
        try {
            sqlSession = dbAccess.getSqlSession();
            sqlSession.update("Login.updateImgPath",user);
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

    public static void main(String[] args) throws IOException {
        Logger log=Logger.getRootLogger();
        log.debug("Debugging Message");
        log.info("information Message");
        log.warn("Warning Message");
        log.error("error Message");
        System.in.read();
    }
}
