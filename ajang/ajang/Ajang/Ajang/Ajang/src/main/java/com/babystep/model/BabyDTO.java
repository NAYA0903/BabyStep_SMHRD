package com.babystep.model;

import java.sql.Date;

public class BabyDTO {
	
	public String byName ;
	public Date byBirthdate;
	public String byGender;
	public int byAge;
	public String userId;
	
	// 기본 생성자
	public BabyDTO () {
		
	}
	
	public BabyDTO (String byName, Date byBirthdate, String byGender, int byAge, String userId) {
		
		this.byName = byName ;
		this.byBirthdate = byBirthdate ;
		this.byGender = byGender ;
		this.byAge = byAge ;
		this.userId = userId ;
		
	}

	
	public BabyDTO(Date byBirthdate) {
		this.byBirthdate = byBirthdate;
	}

	// Getter and Setter
	
	public BabyDTO(int byAge) {
		this.byAge = byAge;
	}

	public String getByName() {
		return byName;
	}

	public void setByName(String byName) {
		this.byName = byName;
	}

	public Date getByBirthdate() {
		return byBirthdate;
	}

	public void setByBirthdate(Date byBirthdate) {
		this.byBirthdate = byBirthdate;
	}

	public String getByGender() {
		return byGender;
	}

	public void setByGender(String byGender) {
		this.byGender = byGender;
	}

	public int getByAge() {
		return byAge;
	}

	public void setByAge(int byAge) {
		this.byAge = byAge;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
