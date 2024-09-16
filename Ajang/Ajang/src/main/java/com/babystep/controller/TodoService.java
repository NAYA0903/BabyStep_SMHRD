package com.babystep.controller;

import java.util.List;
import com.babystep.model.TodoDTO;
import com.babystep.model.TodoDAO;

public class TodoService {
    private TodoDAO todoDAO = new TodoDAO();

    // 선택한 날짜에 맞는 TODO 목록을 조회하는 메서드
    public List<TodoDTO> getTodoListByDate(String userId, String selectedDate) {
        return todoDAO.getTodoListByDate(userId, selectedDate);
    }
}
