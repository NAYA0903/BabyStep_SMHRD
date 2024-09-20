package com.babystep.model;

public class BoardLikeDTO {

	private Integer LIKE_ID ;
	private int BO_IDX ;
	private String USER_ID ;
	
	
	public BoardLikeDTO( Integer LIKE_ID, int BO_IDX, String USER_ID ) {
		this.LIKE_ID = LIKE_ID;
		this.BO_IDX = BO_IDX;
		this.USER_ID = USER_ID;
	}


	public BoardLikeDTO(int BO_IDX, String USER_ID) {
		this.BO_IDX = BO_IDX;
		this.USER_ID = USER_ID;
	}


	public Integer getLIKE_ID() {
		return LIKE_ID;
	}


	public String getUSER_ID() {
		return USER_ID;
	}


	public int getBO_IDX() {
		return BO_IDX;
	}
	
	
	
	
	
}
