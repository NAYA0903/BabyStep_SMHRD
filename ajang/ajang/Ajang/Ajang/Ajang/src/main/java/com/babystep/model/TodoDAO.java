package com.babystep.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.babystep.db.SqlSessionManager;

public class TodoDAO {
	
    SqlSession session = null;

    // 선택한 날짜에 맞는 TODO 목록을 가져오는 메서드
    public List<TodoDTO> getTodoListByDate(String userId, String selectedDate) {

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
    
    // 선택한 날짜에 맞는 TODO 목록을 추가하는 메서드
    public int addTodoListByDate(TodoDTO todo) {
 
    	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
       
        
        int todo_cnt = 0;

        try {
            session = sqlSessionFactory.openSession(); // 세션 열기

            // MyBatis 매퍼 호출
            todo_cnt = session.insert("com.babystep.db.TodoMapper.addTodoListByDate", todo);

            session.commit(); // 트랜잭션 커밋
            
        } catch (Exception e) {
        	
            if (session != null) {
            	
                session.rollback(); // 예외 발생 시 롤백
            }
            
            e.printStackTrace(); // 예외 처리
            
        } finally {
        	
            if (session != null) {
            	
                session.close(); // 세션 닫기
                
            }
        }

        System.out.println("todo_cnt의 개수: " + todo_cnt);
        return todo_cnt;
    }
}
