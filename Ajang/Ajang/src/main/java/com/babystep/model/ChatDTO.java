package com.babystep.model;

public class ChatDTO {
	
	private int CHAT_IDX ;
    private int ROOM_IDX ;
    private String USER_ID ;
    private String CHAT_CONTENT ;
    private String CHAT_EMOTICON ;
    private String CHAT_FILE ;
    private String CHATTED_AT ;
    
    public ChatDTO(String USER_ID, String CHAT_CONTENT) {
    	
		this.USER_ID = USER_ID;
		this.CHAT_CONTENT = CHAT_CONTENT;
	}


    // Getters and Setters

    public int getCHAT_IDX() {
        return CHAT_IDX;
    }

    public void setCHAT_IDX(int CHAT_IDX) {
        this.CHAT_IDX = CHAT_IDX;
    }

    public int getROOM_IDX() {
        return ROOM_IDX;
    }

    public void setROOM_IDX(int ROOM_IDX) {
        this.ROOM_IDX = ROOM_IDX;
    }

    public String getUSER_ID() {
        return USER_ID;
    }

    public void setUSER_ID(String USER_ID) {
        this.USER_ID = USER_ID;
    }

    public String getCHAT_CONTENT() {
        return CHAT_CONTENT;
    }

    public void setChatContent(String CHAT_CONTENT) {
        this.CHAT_CONTENT = CHAT_CONTENT;
    }

    public String getCHAT_EMOTICON() {
        return CHAT_EMOTICON;
    }

    public void setCHAT_EMOTICON(String CHAT_EMOTICON) {
        this.CHAT_EMOTICON = CHAT_EMOTICON;
    }

    public String getCHAT_FILE() {
        return CHAT_FILE;
    }

    public void setCHAT_FILE(String CHAT_FILE) {
        this.CHAT_FILE = CHAT_FILE;
    }

    public String CHATTED_AT() {
        return CHATTED_AT;
    }

    public void setCHATTED_AT(String CHATTED_AT) {
        this.CHATTED_AT = CHATTED_AT;
    }
}
