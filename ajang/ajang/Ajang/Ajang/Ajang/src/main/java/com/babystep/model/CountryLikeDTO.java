package com.babystep.model;

public class CountryLikeDTO {
	
	private int LIKE_ID ;
	private String USER_ID ;
	private int USED_IDX ;
	
	
	public CountryLikeDTO(int LIKE_ID, String USER_ID, int USED_IDX) {
		this.LIKE_ID = LIKE_ID;
		this.USER_ID = USER_ID;
		this.USED_IDX = USED_IDX;
	}
	
	public CountryLikeDTO(String USER_ID, int USED_IDX) {
		this.USER_ID = USER_ID;
		this.USED_IDX = USED_IDX;
	}

	public int getLIKE_ID() {
		return LIKE_ID;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public int getUSED_IDX() {
		return USED_IDX;
	}

	
}	
