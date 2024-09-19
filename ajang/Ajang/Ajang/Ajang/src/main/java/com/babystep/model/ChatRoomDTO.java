package com.babystep.model;

import java.sql.Date;

public class ChatRoomDTO {

    private int roomIdx;

	private String roomTitle;

	private Date openedAt;
    private int roomLimit;
    private String userId;
    private String roomImg;

    public ChatRoomDTO(int roomIdx, String roomTitle, Date openedAt, int roomLimit, String userId, String roomImg) {
    	super();
    	this.roomIdx = roomIdx;
    	this.roomTitle = roomTitle;
    	this.openedAt = openedAt;
    	this.roomLimit = roomLimit;
    	this.userId = userId;
    	this.roomImg = roomImg;
    }
    
    public ChatRoomDTO(String roomTitle, int roomLimit, String roomImg, String userId) {
    	this.roomTitle = roomTitle ;
    	this.roomLimit = roomLimit ;
    	this.roomImg = roomImg ;
    	this.userId = userId ;
    }
    
    @Override
    public String toString() {
    	return "ChatRoomDTO [roomIdx=" + roomIdx + ", roomTitle=" + roomTitle + ", openedAt=" + openedAt
    			+ ", roomLimit=" + roomLimit + ", userId=" + userId + ", roomImg=" + roomImg + "]";
    }
    
    public int getRoomIdx() {
        return roomIdx;
    }

    public void setRoomIdx(int roomIdx) {
        this.roomIdx = roomIdx;
    }

    public String getRoomTitle() {
        return roomTitle;
    }

    public void setRoomTitle(String roomTitle) {
        this.roomTitle = roomTitle;
    }

    public Date getOpenedAt() {
        return openedAt;
    }

    public void setOpenedAt(Date openedAt) {
        this.openedAt = openedAt;
    }

    public int getRoomLimit() {
        return roomLimit;
    }

    public void setRoomLimit(int roomLimit) {
        this.roomLimit = roomLimit;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRoomImg() {
        return roomImg;
    }

    public void setRoomImg(String roomImg) {
        this.roomImg = roomImg;
    }
}
