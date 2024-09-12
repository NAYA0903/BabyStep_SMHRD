package com.babystep.model;

import javax.xml.crypto.Data;

import oracle.sql.NUMBER;

public class CountryDTO {


	private String USED_IDX ;
	private String USED_TITLE;
	private String USED_CONTENT ;
	private int USED_PRICE ;
	private String USED_IMG1;
	private String USED_IMG2;
	private String USED_IMG3;
	private String USED_IMG4;
	private Data CREATED_AT ;
	private String USED_DONE;
	private String USER_ID ;
	
	public CountryDTO(String USED_TITLE, int USED_PRICE,  String USED_CONTENT, String USED_IMG1, String USED_IMG2, String USED_IMG3,String USED_IMG4, String USER_ID) {
		
		this.USED_TITLE = USED_TITLE;
		this.USED_PRICE = USED_PRICE;
		this.USED_CONTENT = USED_CONTENT;
		this.USED_IMG1 = USED_IMG1;
		this.USED_IMG2 = USED_IMG2;
		this.USED_IMG3 = USED_IMG3;
		this.USED_IMG4 = USED_IMG4;
		this.USER_ID = USER_ID;
	}

	public CountryDTO(String USED_IDX, String USED_TITLE, String USED_CONTENT, int USED_PRICE, String USED_IMG1,
			String USED_IMG2, String USED_IMG3, String USED_IMG4, Data CREATED_AT, String USED_DONE, String USER_ID) {
	
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

	public String getUSED_IDX() {
		return USED_IDX;
	}

	public String getUSED_TITLE() {
		return USED_TITLE;
	}

	public String getUSED_CONTENT() {
		return USED_CONTENT;
	}

	public int getUSED_PRICE() {
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

	public Data getCREATED_AT() {
		return CREATED_AT;
	}

	public String getUSED_DONE() {
		return USED_DONE;
	}

	public String getUSER_ID() {
		return USER_ID;
	}
   
	
  
}