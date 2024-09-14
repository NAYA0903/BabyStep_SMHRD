package com.babystep.model;

import java.sql.Date;

public class ChatDTO {

    private int chatIdx;

	private int roomIdx;

	private String userId;
    private String chatContent;
    private String chatEmoti = "";
    private String chatFile = "";
    private Date chattedAt;
    
    public ChatDTO() {
    	
    }
    
    
    public ChatDTO(int chatIdx, int roomIdx, String userId, String chatContent, String chatEmoti, String chatFile,
    		Date chattedAt) {
    	super();
    	this.chatIdx = chatIdx;
    	this.roomIdx = roomIdx;
    	this.userId = userId;
    	this.chatContent = chatContent;
    	this.chatEmoti = chatEmoti;
    	this.chatFile = chatFile;
    	this.chattedAt = chattedAt;
    }
    
    public int getChatIdx() {
        return chatIdx;
    }

    public void setChatIdx(int chatIdx) {
        this.chatIdx = chatIdx;
    }

    public int getRoomIdx() {
        return roomIdx;
    }

    public void setRoomIdx(int roomIdx) {
        this.roomIdx = roomIdx;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getChatContent() {
        return chatContent;
    }

    public void setChatContent(String chatContent) {
        this.chatContent = chatContent;
    }

    public String getChatEmoti() {
        return chatEmoti;
    }

    public void setChatEmoti(String chatEmoti) {
        this.chatEmoti = chatEmoti;
    }

    public String getChatFile() {
        return chatFile;
    }

    public void setChatFile(String chatFile) {
        this.chatFile = chatFile;
    }

    public Date getChattedAt() {
        return chattedAt;
    }

    public void setChattedAt(Date chattedAt) {
        this.chattedAt = chattedAt;
    }
}
