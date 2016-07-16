package edu.graduation.bean;

import java.util.List;

/**
 * Created by Tony on 16/5/14.
 */
public class UserJoinDate {
    private int joinId;                                 //编号
    private int UserId;                             //用户ID
    private int DateId;                             //参与的约会ID
    private String UserName;                        //用户名字
    private int number;

    public int getJoinId() {
        return joinId;
    }

    public void setJoinId(int joinId) {
        this.joinId = joinId;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    private List<Dating> datingList;

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }



    public int getId() {
        return joinId;
    }

    public void setId(int joinId) {
        this.joinId = joinId;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public int getDateId() {
        return DateId;
    }

    public void setDateId(int dateId) {
        DateId = dateId;
    }

    public List<Dating> getDatingList() {
        return datingList;
    }

    public void setDatingList(List<Dating> datingList) {
        this.datingList = datingList;
    }
}
