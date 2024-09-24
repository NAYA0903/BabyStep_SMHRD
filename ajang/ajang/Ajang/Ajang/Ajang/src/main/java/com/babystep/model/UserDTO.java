package com.babystep.model;

public class UserDTO {
	// Users 테이블에 대한 내용을 설계하는 DTO
	
	
	private String id;
	private String pw;
	private String nickname;
	private String addr;
	private String JOINED_AT ;
	
	public UserDTO(String id, String pw, String nickname, String addr) {
		
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
		this.addr = addr;
	}
	
	

	public UserDTO(String id, String pw, String nickname, String addr, String jOINED_AT) {
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
		this.addr = addr;
		this.JOINED_AT = jOINED_AT;
	}

	public UserDTO(String id) {
		this.id = id ;
	} 

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getID() {
		return id;
	}
	public void setID(String id) {
		this.id = id;
	}
	public String getPW() {
		return pw;
	}
	
	public String JOINED_AT() {
		return JOINED_AT;
	}
	public void setPW(String pw) {
		this.pw = pw;
	}
	public String getNICKNAME() {
		return nickname;
	}
	public void setNICKNAME(String nickname) {
		this.nickname = nickname;
	}
	
	
}
