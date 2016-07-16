package edu.graduation.service.impl;

import edu.graduation.bean.Admin;
import edu.graduation.bean.Dating;
import edu.graduation.bean.User;
import edu.graduation.dao.adminDao;
import edu.graduation.service.AdminLoginService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Tony on 16/5/14.
 */
@Service("AdminLoginService")
public class AdminLoginServiceImpl implements AdminLoginService {
    public Admin adminLogin(Admin admin) {
        adminDao AdminDao=new adminDao();
        return AdminDao.Login(admin);
    }
    public List<User> checkUserList(User user) {
        adminDao AdminDao=new adminDao();
        return AdminDao.checkUserList(user);
    }

    public List<Dating> checkDateList(Dating dating) {
        adminDao AdminDao=new adminDao();
        return AdminDao.checkDateList(dating);
    }

    public void deleteOneUser(String id) {
        if(id != null && !"".equals(id.trim())) {
            adminDao AdminDao=new adminDao();
            AdminDao.deleteOneUser(Integer.valueOf(id));
        }
    }
    public void deleteOneDate(String id) {
        if(id != null && !"".equals(id.trim())) {
            adminDao AdminDao=new adminDao();
            AdminDao.deleteOneDate(Integer.valueOf(id));
        }
    }
    public void deleteBatch(String[] ids){
        adminDao AdminDao = new adminDao();
        List<Integer> idList=new ArrayList<Integer>();
        for(String id:ids){
            idList.add(Integer.valueOf(id));
        }
        AdminDao.deleteBatch(idList);
    }
    public void deleteBatchDate(String[] ids){
        adminDao AdminDao = new adminDao();
        List<Integer> idList=new ArrayList<Integer>();
        for(String id:ids){
            idList.add(Integer.valueOf(id));
        }
        AdminDao.deleteBatchDate(idList);
    }
    public void makeValid(String id) {
        if(id != null && !"".equals(id.trim())) {
            adminDao AdminDao=new adminDao();
            AdminDao.makeValid(Integer.valueOf(id));
        }
    }

}
