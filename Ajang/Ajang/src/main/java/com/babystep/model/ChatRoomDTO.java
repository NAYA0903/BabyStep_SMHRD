package com.babystep.model;

	public class ChatRoomDTO {
	
		private int ROOM_INDEX ;
		private String ROOM_TITLE ;
		private String OPENED_AT ;
		private int ROOM_LIMIT ;
		private String USER_ID ;
		private String ROOM_IMG ;
	
	public ChatRoomDTO(int ROOM_INDEX, String ROOM_TITLE, String OPENED_AT, 
						int ROOM_LIMIT, String USER_ID, String ROOM_IMG) {
		
		this.ROOM_INDEX = ROOM_INDEX;
		this.ROOM_TITLE = ROOM_TITLE;
		this.OPENED_AT = OPENED_AT;
		this.ROOM_LIMIT = ROOM_LIMIT;
		this.USER_ID = USER_ID;
		this.ROOM_IMG = ROOM_IMG;
		
	}

	public int getROOM_INDEX() {
		return ROOM_INDEX;
	}

	public void setROOM_INDEX(int ROOM_INDEX) {
		this.ROOM_INDEX = ROOM_INDEX;
	}

	public String getROOM_TITLE() {
		return ROOM_TITLE;
	}

	public void setROOM_TITLE(String ROOM_TITLE) {
		this.ROOM_TITLE = ROOM_TITLE;
	}

	public String getOPENED_AT() {
		return OPENED_AT;
	}

	public void setOPENED_AT(String OPENED_AT) {
		this.OPENED_AT = OPENED_AT;
	}

	public int getROOM_LIMIT() {
		return ROOM_LIMIT;
	}

	public void setROOM_LIMIT(int ROOM_LIMIT) {
		this.ROOM_LIMIT = ROOM_LIMIT;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String USER_ID) {
		this.USER_ID = USER_ID;
	}

	public String getROOM_IMG() {
		return ROOM_IMG;
	}

	public void setROOM_IMG(String ROOM_IMG) {
		this.ROOM_IMG = ROOM_IMG;
	}
	

}
