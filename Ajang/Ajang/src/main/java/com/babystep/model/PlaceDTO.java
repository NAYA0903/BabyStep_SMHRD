package com.babystep.model;

import java.sql.Date;

public class PlaceDTO {

    // 장소 식별자 
    private Double place_idx;

    // 장소 명 
    private String place_name;

    // 장소 주소 
    private String place_addr;

    // 장소 전화번호 
    private String place_tel;

    // 장소 URL 
    private String place_url;

    // 등록 날짜 
    private Date createc_at;

    // 등록자 아이디 
    private String user_id;

    // 좋아요 수 
    private Integer place_likes;

    // Getter 및 Setter
    public Double getPlaceIdx() {
        return place_idx;
    }

    public void setPlaceIdx(Double placeIdx) {
        this.place_idx = placeIdx; // 매개변수를 사용하도록 수정
    }

    public String getPlaceName() {
        return place_name;
    }

    public void setPlaceName(String placeName) {
        this.place_name = placeName; // 매개변수를 사용하도록 수정
    }

    public String getPlaceAddr() {
        return place_addr;
    }

    public void setPlaceAddr(String placeAddr) {
        this.place_addr = placeAddr; // 매개변수를 사용하도록 수정
    }

    public String getPlaceTel() {
        return place_tel;
    }

    public void setPlaceTel(String placeTel) {
        this.place_tel = placeTel; // 매개변수를 사용하도록 수정
    }

    public String getPlaceUrl() {
        return place_url;
    }

    public void setPlaceUrl(String placeUrl) {
        this.place_url = placeUrl; // 매개변수를 사용하도록 수정
    }

    public Date getCreatecAt() {
        return createc_at;
    }

    public void setCreatecAt(Date createcAt) {
        this.createc_at = createcAt; // 매개변수를 사용하도록 수정
    }

    public String getUserId() {
        return user_id;
    }

    public void setUserId(String userId) {
        this.user_id = userId; // 매개변수를 사용하도록 수정
    }

    public Integer getPlaceLikes() {
        return place_likes;
    }

    public void setPlaceLikes(Integer placeLikes) {
        this.place_likes = placeLikes; // 매개변수를 사용하도록 수정
    }

    // tb_place 모델 복사
    public void CopyData(PlaceDTO param) {
        this.place_idx = param.getPlaceIdx();
        this.place_name = param.getPlaceName();
        this.place_addr = param.getPlaceAddr();
        this.place_tel = param.getPlaceTel();
        this.place_url = param.getPlaceUrl();
        this.createc_at = param.getCreatecAt();
        this.user_id = param.getUserId();
        this.place_likes = param.getPlaceLikes();
    }
}
