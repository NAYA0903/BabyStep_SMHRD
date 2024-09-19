package com.babystep.model;

import java.sql.Date;

public class DiaryPopupDTO {
	
	
	private int DI_IDX ;
	private String DI_TITLE ;
	private String DI_CONTENT ;
	private String DI_FILE1 ;
	private String DI_FILE2 ;
	private Date CREATED_AT ;
	private String USER_ID ;
	private int DI_BABYNUMBER ;
	private int DI_HEIGHT ;
	private int DI_WEIGHT;
	
	
	public DiaryPopupDTO(int dI_IDX, String dI_TITLE, String dI_CONTENT, String dI_FILE1, String dI_FILE2,
			Date cREATED_AT, String uSER_ID, int dI_BABYNUMBER, int dI_HEIGHT, int dI_WEIGHT) {
		this.DI_IDX = dI_IDX;
		this.DI_TITLE = dI_TITLE;
		this.DI_CONTENT = dI_CONTENT;
		this.DI_FILE1 = dI_FILE1;
		this.DI_FILE2 = dI_FILE2;
		this.CREATED_AT = cREATED_AT;
		this.USER_ID = uSER_ID;
		this.DI_BABYNUMBER = dI_BABYNUMBER;
		this.DI_HEIGHT = dI_HEIGHT;
	
	
}


	public int getDI_IDX() {
		return DI_IDX;
	}


	public String getDI_TITLE() {
		return DI_TITLE;
	}


	public String getDI_CONTENT() {
		return DI_CONTENT;
	}


	public String getDI_FILE1() {
		return DI_FILE1;
	}


	public String getDI_FILE2() {
		return DI_FILE2;
	}


	public Date getCREATED_AT() {
		return CREATED_AT;
	}


	public String getUSER_ID() {
		return USER_ID;
	}


	public int getDI_BABYNUMBER() {
		return DI_BABYNUMBER;
	}


	public int getDI_HEIGHT() {
		return DI_HEIGHT;
	}


	public int getDI_WEIGHT() {
		return DI_WEIGHT;
	}
}