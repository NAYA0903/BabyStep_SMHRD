package com.babystep.model;

import java.sql.Date;

public class PlaceLikeDTO {
	// 찜한 장소 
	

	    // 찜 식별자 
	    private Double fav_idx;

	    // 장소 식별자 
	    private Double place_idx;

	    // 사용자 아이디 
	    private String user_id;

	    // 등록 날짜 
	    private Date created_at;

	    public Double getFavIdx() {
	        return fav_idx;
	    }

	    public void setFavIdx(Double favIdx) {
	        this.fav_idx = fav_idx;
	    }

	    public Double getPlaceIdx() {
	        return place_idx;
	    }

	    public void setPlaceIdx(Double placeIdx) {
	        this.place_idx = place_idx;
	    }

	    public String getUserId() {
	        return user_id;
	    }

	    public void setUserId(String userId) {
	        this.user_id = user_id;
	    }

	    public Date getCreatedAt() {
	        return created_at;
	    }

	    public void setCreatedAt(Date createdAt) {
	        this.created_at = created_at;
	    }

	    // tb_favorite 모델 복사
	    public void CopyData(PlaceLikeDTO param)
	    {
	        this.fav_idx = param.getFavIdx();
	        this.place_idx = param.getPlaceIdx();
	        this.user_id = param.getUserId();
	        this.created_at = param.getCreatedAt();
	    }
	
}
