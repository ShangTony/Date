package edu.graduation.bean;

import java.util.Date;

/**
 * Created by Tony on 16/5/8.
 */
public class Message {
    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }



    public int getWriteId() {
        return writeId;
    }

    public void setWriteId(int writeId) {
        this.writeId = writeId;
    }

    private int messageId;                        //留言信息ID
    private String content;                       //留言信息内容

    public String getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(String messageTime) {
        this.messageTime = messageTime;
    }

    private String messageTime;                     //留言时间
    private int writeId;                          //留言者ID
    private int datingId;                         //留言的约会


    public int getDatingId() {
        return datingId;
    }

    public void setDatingId(int datingId) {
        this.datingId = datingId;
    }
}
