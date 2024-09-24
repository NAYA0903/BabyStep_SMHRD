package com.babystep.model;

public class ShareDTO {
    private int shareIdx;      // 공유 식별자
    private int scheIdx;       // 일정 식별자
    private String shareId;    // 공유 요청한 사용자 ID
    private String userId;     // 공유된 사용자 ID 
    
    // 일반 생성자
    public ShareDTO () {
    	
    }
    
    // 전체 사용자 
    public ShareDTO (int shareIdx, int scheIdx, String shareId, String userId) {
    	
    	this.shareIdx = shareIdx ;
    	this.scheIdx = scheIdx ;
    	this.shareId = shareId ;
    	this.userId = userId ;
    }
    
    // Getters and Setters
    public int getShareIdx() {
        return shareIdx;
    }

    public void setShareIdx(int shareIdx) {
        this.shareIdx = shareIdx;
    }

    public int getScheIdx() {
        return scheIdx;
    }

    public void setScheIdx(int scheIdx) {
        this.scheIdx = scheIdx;
    }

    public String getShareId() {
        return shareId;
    }

    public void setShareId(String shareId) {
        this.shareId = shareId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}