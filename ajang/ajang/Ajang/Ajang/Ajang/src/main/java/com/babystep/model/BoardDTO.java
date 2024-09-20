package com.babystep.model;

import java.sql.Date;

public class BoardDTO {
    private int BO_IDX; // 글 번호
    private String BO_TITLE; // 글 제목 
    private String BO_CONTENT; // 글 내용 
    private Date CREATED_AT; // 글 작성일자
    private Integer BO_VIEWS; // 글 조회수  
    private Integer BO_LIKES; // 글 좋아요수 
    private String USER_ID; // 글 작성자
    private String BO_FILENAME1; // 파일이름1
    private String BO_FILENAME2; // 파일이름2
    private String BO_FILENAME3; // 파일이름3
    private String BO_FILENAME4; // 파일이름4
    private String USER_NICK ;
    
    // 생성자
    public BoardDTO(int BO_IDX, String BO_TITLE, String BO_CONTENT, Date CREATED_AT, Integer BO_VIEWS, Integer BO_LIKES,
            String USER_ID, String BO_FILENAME1, String BO_FILENAME2, String BO_FILENAME3, String BO_FILENAME4, String USER_NICK)  {
        this.BO_IDX = BO_IDX;
        this.BO_TITLE = BO_TITLE;
        this.BO_CONTENT = BO_CONTENT;
        this.CREATED_AT = CREATED_AT;
        this.BO_VIEWS = BO_VIEWS;
        this.BO_LIKES = BO_LIKES;
        this.USER_ID = USER_ID;
        this.BO_FILENAME1 = BO_FILENAME1;
        this.BO_FILENAME2 = BO_FILENAME2;
        this.BO_FILENAME3 = BO_FILENAME3;
        this.BO_FILENAME4 = BO_FILENAME4;
        this.USER_NICK = USER_NICK; 
    }
    
    

    public BoardDTO(String BO_TITLE, String BO_CONTENT, String USER_ID, String BO_FILENAME1, String BO_FILENAME2, 
                    String BO_FILENAME3, String BO_FILENAME4) {
        this.BO_TITLE = BO_TITLE;
        this.BO_CONTENT = BO_CONTENT;
        this.USER_ID = USER_ID;
        this.BO_FILENAME1 = BO_FILENAME1;
        this.BO_FILENAME2 = BO_FILENAME2;
        this.BO_FILENAME3 = BO_FILENAME3;
        this.BO_FILENAME4 = BO_FILENAME4;
    }

    public BoardDTO() {}

    @Override
    public String toString() {
        return "BoardDTO [BO_IDX=" + BO_IDX + ", BO_TITLE=" + BO_TITLE + ", BO_CONTENT=" + BO_CONTENT + 
               ", CREATED_AT=" + CREATED_AT + ", BO_VIEWS=" + BO_VIEWS + ", BO_LIKES=" + BO_LIKES + 
               ", USER_ID=" + USER_ID + ", BO_FILENAME1=" + BO_FILENAME1 + ", BO_FILENAME2=" + BO_FILENAME2 + 
               ", BO_FILENAME3=" + BO_FILENAME3 + ", BO_FILENAME4=" + BO_FILENAME4 + "]";
    }

    public int getBO_IDX() {
        return BO_IDX;
    }

    public String getBO_TITLE() {
        return BO_TITLE;
    }

    public String getBO_CONTENT() {
        return BO_CONTENT;
    }

    public Date getCREATED_AT() {
        return CREATED_AT;
    }

    public Integer getBO_VIEWS() {
        return BO_VIEWS;
    }

    public Integer getBO_LIKES() {
        return BO_LIKES;
    }

    public String getUSER_ID() {
        return USER_ID;
    }

    public String getBO_FILENAME1() {
        return BO_FILENAME1;
    }

    public String getBO_FILENAME2() {
        return BO_FILENAME2;
    }

    public String getBO_FILENAME3() {
        return BO_FILENAME3;
    }

    public String getBO_FILENAME4() {
        return BO_FILENAME4;
    }
    public String getUSER_NICK() {
        return USER_NICK;
    }
    public void setUSER_NICK(String USER_NICK) {
        this.USER_NICK = USER_NICK;
    }

}

