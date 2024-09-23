package com.babystep.model;

import java.sql.Date;

public class DiaryPopupDTO {

	private int DI_IDX;
	private String DI_TITLE;
	private String DI_CONTENT;
	private String DI_FILE1;
	private String DI_FILE2;
	private Date CREATED_AT;
	private String USER_ID;
	private int DI_BABYNUMBER;
	private int DI_HEIGHT;
	private int DI_WEIGHT;

	// 기본 생성자 생성 : 초기화
	public DiaryPopupDTO() {

	}

	// 수정된 생성자: java.util.Date를 java.sql.Date로 변환
	public DiaryPopupDTO(String DI_TITLE, String DI_CONTENT, String DI_FILE1, String DI_FILE2,
			java.util.Date CREATED_AT, String USER_ID, int DI_BABYNUMBER, int DI_HEIGHT, int DI_WEIGHT) {

		this.DI_TITLE = DI_TITLE;
		this.DI_CONTENT = DI_CONTENT;
		this.DI_FILE1 = DI_FILE1;
		this.DI_FILE2 = DI_FILE2;

		// java.util.Date를 java.sql.Date로 변환
		this.CREATED_AT = new java.sql.Date(CREATED_AT.getTime());

		this.USER_ID = USER_ID;
		this.DI_BABYNUMBER = DI_BABYNUMBER;
		this.DI_HEIGHT = DI_HEIGHT;
		this.DI_WEIGHT = DI_WEIGHT;
	}

	public DiaryPopupDTO(String DI_TITLE, String DI_CONTENT, String DI_FILE1, String DI_FILE2,
			java.util.Date CREATED_AT, String USER_ID,  int DI_HEIGHT, int DI_WEIGHT) {

		this.DI_TITLE = DI_TITLE;
		this.DI_CONTENT = DI_CONTENT;
		this.DI_FILE1 = DI_FILE1;
		this.DI_FILE2 = DI_FILE2;

// java.util.Date를 java.sql.Date로 변환
		this.CREATED_AT = new java.sql.Date(CREATED_AT.getTime());

		this.USER_ID = USER_ID;
		this.DI_HEIGHT = DI_HEIGHT;
		this.DI_WEIGHT = DI_WEIGHT;
	}

	public DiaryPopupDTO(String USER_ID) {
		this.USER_ID = USER_ID;
	}

	// Getter 메서드들
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
