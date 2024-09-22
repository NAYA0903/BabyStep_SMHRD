package com.babystep.model;

import java.sql.Date;

public class ScheduleDTO {
	
	private String scheContent;
	private Date scheStDt;
	private Date scheEdDt;
	private Date createdAt;
	private String userId;
	private String scheTitle;
	
	// 기본 생성자
	public ScheduleDTO() {
		
	}
	
	// 일정 등록 생성자
	public ScheduleDTO(String scheTitle, String scheContent, Date scheStDt, Date scheEdDt, Date createdAt, String userId) {
		
		this.scheTitle = scheTitle ;
		this.scheContent = scheContent ;
		this.scheStDt = scheStDt ;
		this.scheEdDt = scheEdDt ;
		this.createdAt = createdAt ;
		this.userId = userId ;
		
	}
	
	// 일정 조회 생성자
	public ScheduleDTO(Date scheStDt, String userId) {
		
		this.scheStDt = scheStDt ;
		this.userId = userId ;
		
	}

	// Getter and Setter
	
	public String getScheTitle() {
		return scheTitle;
	}
	
	public void setScheTitle(String scheTitle) {
		this.scheTitle = scheTitle;
	}
	
	public String getScheContent() {
		return scheContent;
	}
	
	public void setScheContent(String scheContent) {
		this.scheContent = scheContent;
	}
	
	public Date getScheStDt() {
		return scheStDt;
	}
	
	public void setScheStDt(Date scheStDt) {
		this.scheStDt = scheStDt;
	}
	
	public Date getScheEdDt() {
		return scheEdDt;
	}
	
	public void setScheEdDt(Date scheEdDt) {
		this.scheEdDt = scheEdDt;
	}
	
	public Date getCreatedAt() {
		return createdAt;
	}
	
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	

}
