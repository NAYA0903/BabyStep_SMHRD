package com.babystep.controller;

import java.sql.Date;
import java.util.List;

import com.babystep.model.DiaryPopupDAO;
import com.babystep.model.DiaryPopupDTO;
import com.babystep.model.TodoDAO;
import com.babystep.model.TodoDTO;

public class TodoService {
    private TodoDAO todoDAO = new TodoDAO();
    private DiaryPopupDAO diarypopupDAO = new DiaryPopupDAO(); 

    // 선택한 날짜에 맞는 TODO 목록을 조회하는 메서드
    public List<TodoDTO> getTodoListByDate(String userId, String selectedDate) {
        return todoDAO.getTodoListByDate(userId, selectedDate);
    }
    
    // 선택한 날짜에 맞는 TODO 목록을 추가하는 메서드
    public void addTodoListByDate(String todoContent, Date todoDate, String userId) {
    	TodoDTO todo = new TodoDTO(todoContent, todoDate, userId, todoDate);
    	todo.setTodoContent(todoContent);
    	todo.setTodoDate(todoDate);
    	todo.setUserId(userId);
    	
    	todoDAO.addTodoListByDate(todo);
    }
    
    public List<DiaryPopupDTO> detaildiary(String USER_ID, String selectedDate) { 
        return diarypopupDAO.detaildiary(USER_ID, selectedDate) ;
            
    }
}
