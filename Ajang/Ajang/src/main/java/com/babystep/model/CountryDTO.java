package com.babystep.model;

import java.sql.Timestamp;

public class CountryDTO {

    private int USED_IDX;
    private String USED_TITLE;
    private String USED_CONTENT;
    private Integer USED_PRICE;
    private String USED_IMG1;
    private String USED_IMG2;
    private String USED_IMG3;
    private String USED_IMG4;
    private Timestamp CREATED_AT;  
    private String USED_DONE;
    private String USER_ID;

    // 첫 번째 생성자
    public CountryDTO(String USED_TITLE, Integer USED_PRICE, String USED_CONTENT, String USED_IMG1, String USED_IMG2,
                      String USED_IMG3, String USED_IMG4, String USER_ID) {
        this.USED_TITLE = USED_TITLE;
        this.USED_PRICE = USED_PRICE;
        this.USED_CONTENT = USED_CONTENT;
        this.USED_IMG1 = USED_IMG1;
        this.USED_IMG2 = USED_IMG2;
        this.USED_IMG3 = USED_IMG3;
        this.USED_IMG4 = USED_IMG4;
        this.USER_ID = USER_ID;
    }

    // 두 번째 생성자
    public CountryDTO(int USED_IDX, String USED_TITLE, String USED_CONTENT, Integer USED_PRICE, String USED_IMG1,
                      String USED_IMG2, String USED_IMG3, String USED_IMG4, Timestamp CREATED_AT, String USED_DONE,
                      String USER_ID) {
        this.USED_IDX = USED_IDX;
        this.USED_TITLE = USED_TITLE;
        this.USED_CONTENT = USED_CONTENT;
        this.USED_PRICE = USED_PRICE;
        this.USED_IMG1 = USED_IMG1;
        this.USED_IMG2 = USED_IMG2;
        this.USED_IMG3 = USED_IMG3;
        this.USED_IMG4 = USED_IMG4;
        this.CREATED_AT = CREATED_AT;
        this.USED_DONE = USED_DONE;
        this.USER_ID = USER_ID;
    }

    // 게터 메서드들
    public int getUSED_IDX() {
        return USED_IDX;
    }

    public String getUSED_TITLE() {
        return USED_TITLE;
    }

    public String getUSED_CONTENT() {
        return USED_CONTENT;
    }

    public Integer getUSED_PRICE() {
        return USED_PRICE;
    }

    public String getUSED_IMG1() {
        return USED_IMG1;
    }

    public String getUSED_IMG2() {
        return USED_IMG2;
    }

    public String getUSED_IMG3() {
        return USED_IMG3;
    }

    public String getUSED_IMG4() {
        return USED_IMG4;
    }

    public Timestamp getCREATED_AT() {
        return CREATED_AT;
    }

    public String getUSED_DONE() {
        return USED_DONE;
    }

    public String getUSER_ID() {
        return USER_ID;
    }
}
