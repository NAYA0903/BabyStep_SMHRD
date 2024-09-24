package com.babystep.model;

import java.sql.Date;

public class CommentDTO {
	
	private int commentIdx ;
	private int boIdx ;
	private String userId ;
	private String commentContent ;
	private Date createdAt ;
	
	public CommentDTO () {
		
	}
	
	public CommentDTO(int commentIdx, int boIdx, String userId, String commentContent, Date createdAt) {
		super();
		this.commentIdx = commentIdx;
		this.boIdx = boIdx;
		this.userId = userId;
		this.commentContent = commentContent;
		this.createdAt = createdAt;
	}

	public int getCommentIdx() {
		return commentIdx;
	}

	public void setCommentIdx(int commentIdx) {
		this.commentIdx = commentIdx;
	}

	public int getBoIdx() {
		return boIdx;
	}

	public void setBoIdx(int boIdx) {
		this.boIdx = boIdx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
}
