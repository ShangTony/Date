package edu.graduation.bean;

import java.util.Date;
import java.util.List;

/**
 * Created by Tony on 16/4/16.
 */
public class User {

    private int id;                      //主键
    private String name;                 //登录用户民
    private String password;             //登录密码
    private String showName;                 //昵称
    private String imgPath;               //用户头像路径
    private String sex;                     //性别
    private String birthday;                //生日
    private List<Dating> DatingList;      //约会列表
    private List<Message> messageList;       //留言信息列表



    public String getShowName() {
        return showName;
    }

    public void setShowName(String showName) {
        this.showName = showName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }



    public List<Dating> getDatingList() {
        return DatingList;
    }

    public void setDatingList(List<Dating> datingList) {
        DatingList = datingList;
    }

    public List<Message> getMessageList() {
        return messageList;
    }

    public void setMessageList(List<Message> messageList) {
        this.messageList = messageList;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }


}
