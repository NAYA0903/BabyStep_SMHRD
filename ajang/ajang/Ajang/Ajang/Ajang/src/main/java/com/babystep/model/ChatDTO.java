package com.babystep.model;

import java.sql.Timestamp;

public class ChatDTO {

    private int chatIdx;

	private int roomIdx;

	private String userId;
    private String chatContent;
    private String chatEmoticon = "";
    private String chatFile = "";
    private Timestamp chattedAt;
    
    public ChatDTO() {}
    
    
    public ChatDTO(int chatIdx, int roomIdx, String userId, String chatContent, String chatEmoticon, String chatFile,
    		Timestamp chattedAt) {
    	
    	this.chatIdx = chatIdx;
    	this.roomIdx = roomIdx;
    	this.userId = userId;
    	this.chatContent = chatContent;
    	this.chatEmoticon = chatEmoticon;
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

    public String getChatEmoticon() {
        return chatEmoticon;
    }

    public void setChatEmoti(String chatEmoticon) {
        this.chatEmoticon = chatEmoticon;
    }

    public String getChatFile() {
        return chatFile;
    }

    public void setChatFile(String chatFile) {
        this.chatFile = chatFile;
    }

    public Timestamp getChattedAt() {
        return chattedAt;
    }

    public void setChattedAt(Timestamp chattedAt) {
        this.chattedAt = chattedAt;
    }
    
}
