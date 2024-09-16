package com.babystep.model;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.babystep.db.SqlSessionManager;

public class TodoDAO {

    // 선택한 날짜에 맞는 TODO 목록을 가져오는 메서드
    public List<TodoDTO> getTodoListByDate(String userId, String selectedDate) {
        SqlSession session = null;
        List<TodoDTO> todoList = null;
        
        try {
            // SqlSessionManager를 사용하여 세션 열기
            session = SqlSessionManager.getSession();
            
            // 파라미터로 넘길 Map 생성
            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put("userId", userId);
            paramMap.put("selectedDate", selectedDate);
            
            // MyBatis 매퍼 호출
            todoList = session.selectList("com.babystep.db.TodoMapper.getTodoListByDate", paramMap);
        } finally {
            if (session != null) {
                session.close(); // 세션 닫기
            }
        }
        return todoList;
    }
}
