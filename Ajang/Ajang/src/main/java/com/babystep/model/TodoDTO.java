package com.babystep.model;

import java.util.Date;

public class TodoDTO {
	
	private int todoIdx;
    private String todoContent;
    private Date todoDate;
    private String todoDone;
    private String userId;
    private Date createdAt;
    
    

    // Getter와 Setter 메서드
    
    public int getTodoIdx() { 
    	return todoIdx; 
    	}
    
    public void setTodoIdx(int todoIdx) { 
    	this.todoIdx = todoIdx; 
    	}
    
    public String getTodoContent() { 
    	return todoContent; 
    	}
    
    public void setTodoContent(String todoContent) { 
    	this.todoContent = todoContent; 
    	}

    public Date getTodoDate() { 
    	return todoDate; 
    	}
    
    public void setTodoDate(Date todoDate) { 
    	this.todoDate = todoDate; 
    	}

    public String getTodoDone() { 
    	return todoDone; 
    	}
    
    public void setTodoDone(String todoDone) { 
    	this.todoDone = todoDone; 
    	}
    
    public String getUserId() {
    	return userId;
    }
    
    public void setUserId(String userId) {
    	this.userId = userId; 
    }
    
    public Date getCreatedAt() {
    	return createdAt;
    }
    
    public void setCreatedAt(Date createdAt) {
    	this.createdAt = createdAt;
    }
}