package edu.graduation.service.impl;

import edu.graduation.bean.Dating;
import edu.graduation.bean.User;
import edu.graduation.service.createDatingService;
import org.springframework.stereotype.Service;
import edu.graduation.dao.createDatingDao;

import java.util.List;

/**
 * Created by Tony on 16/5/3.
 */
@Service("createDatingServiece")
public class createDatingServiceImpl implements createDatingService {
    public void createDating(Dating date) {
        createDatingDao CreateDatingDao=new createDatingDao();
         CreateDatingDao.createDating(date);
    }
    public Dating selectDateId(Dating date) {
        createDatingDao CreateDatingDao=new createDatingDao();
         return CreateDatingDao.selectDateId(date);
    }

    public List<Dating> show(){
        createDatingDao CreateDatingDao=new createDatingDao();
        return CreateDatingDao.show();
    }

    public List<Dating> showDateWithId(int id){
        createDatingDao CreateDatingDao=new createDatingDao();
        return CreateDatingDao.showDateWithId(id);
    }
    public List<User> UserDateList(int id){
        createDatingDao CreateDatingDao=new createDatingDao();
        return CreateDatingDao.UserDateList(id);
    }

    public void deleteDate(int id){
        createDatingDao CreateDatingDao=new createDatingDao();
        CreateDatingDao.deleteDate(id);
        CreateDatingDao.deleteDateJoin(id);
    }

    public List<Dating> placeSearch(Dating dating){
        createDatingDao CreateDatingDao=new createDatingDao();
        return CreateDatingDao.placeSearch(dating);
    }
    public List<Dating> descriptionSearch(Dating dating){
        createDatingDao CreateDatingDao=new createDatingDao();
        return CreateDatingDao.descriptionSearch(dating);
    }
    public List<Dating> timeSearch(Dating dating){
        createDatingDao CreateDatingDao=new createDatingDao();
        return CreateDatingDao.timeSearch(dating);
    }

}
