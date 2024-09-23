package com.babystep.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ScheduleDAO {

    private SqlSessionFactory sqlSessionFactory;

    // SqlSessionFactory를 매개변수로 받는 생성자 추가
    public ScheduleDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    // 일정 추가하는 메서드
    public int addSchedule(ScheduleDTO sche) {


        // try-with-resources 구문에서 자동으로 세션을 닫음
        try (SqlSession session = sqlSessionFactory.openSession()) {

            // MyBatis 매퍼 호출
        	session.insert("com.babystep.db.ScheduleMapper.addSchedule", sche);

            // 트랜잭션 커밋
            session.commit();

        } catch (Exception e) {
            e.printStackTrace(); // 예외 처리
        }

        // 로그 출력
        return sche.getScheIdx();
    }
    
    
    // 특정 날짜의 일정 조회
    public List<ScheduleDTO> getSchedulesByDate(String userId, Date selectedDate) {
    	
        try (SqlSession session = sqlSessionFactory.openSession()) {
        	
            Map<String, Object> params = new HashMap<>();
            params.put("userId", userId);
            params.put("selectedDate", selectedDate);
            
            List<ScheduleDTO> scheduleList = session.selectList("com.babystep.db.ScheduleMapper.getSchedulesByDate", params);
            session.commit();  // 트랜잭션 수동 커밋
            
            return scheduleList;
        }
    }
}
