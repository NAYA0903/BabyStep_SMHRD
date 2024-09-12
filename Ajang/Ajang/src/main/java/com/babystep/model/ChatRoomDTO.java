package com.babystep.model;

public class ChatRoomDTO {

    private int roomIndex;
    private String roomTitle;
    private String openedAt;
    private int roomLimit;
    private String userId;
    private String roomImg;

    public ChatRoomDTO(int roomIndex, String roomTitle, String openedAt, int roomLimit, String userId, String roomImg) {
        this.roomIndex = roomIndex;
        this.roomTitle = roomTitle;
        this.openedAt = openedAt;
        this.roomLimit = roomLimit;
        this.userId = userId;
        this.roomImg = roomImg;
    }

    public int getRoomIndex() {
        return roomIndex;
    }

    public void setRoomIndex(int roomIndex) {
        this.roomIndex = roomIndex;
    }

    public String getRoomTitle() {
        return roomTitle;
    }

    public void setRoomTitle(String roomTitle) {
        this.roomTitle = roomTitle;
    }

    public String getOpenedAt() {
        return openedAt;
    }

    public void setOpenedAt(String openedAt) {
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
