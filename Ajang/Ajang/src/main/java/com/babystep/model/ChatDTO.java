package com.babystep.model;

public class ChatDTO {

    private int chatIdx;
    private int roomIdx;
    private String userId;
    private String chatContent;
    private String chatEmoticon;
    private String chatFile;
    private String chattedAt;

    public ChatDTO(String userId, String chatContent) {
        this.userId = userId;
        this.chatContent = chatContent;
    }

    // Getters and Setters

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

    public void setChatEmoticon(String chatEmoticon) {
        this.chatEmoticon = chatEmoticon;
    }

    public String getChatFile() {
        return chatFile;
    }

    public void setChatFile(String chatFile) {
        this.chatFile = chatFile;
    }

    public String getChattedAt() {
        return chattedAt;
    }

    public void setChattedAt(String chattedAt) {
        this.chattedAt = chattedAt;
    }
}
