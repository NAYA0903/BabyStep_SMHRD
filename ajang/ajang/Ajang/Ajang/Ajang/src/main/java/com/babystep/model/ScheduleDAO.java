package com.babystep.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.babystep.db.SqlSessionManager;

public class ScheduleDAO {

    private SqlSessionFactory sqlSessionFactory;

    // SqlSessionFactory를 매개변수로 받는 생성자 추가
    public ScheduleDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    // 일정 추가하는 메서드
    public int addSchedule(ScheduleDTO sche) {

        int scheCnt = 0;

        // try-with-resources 구문에서 자동으로 세션을 닫음
        try (SqlSession session = sqlSessionFactory.openSession()) {

            // MyBatis 매퍼 호출
            scheCnt = session.insert("com.babystep.db.ScheduleMapper.addSchedule", sche);

            // 트랜잭션 커밋
            session.commit();

        } catch (Exception e) {
            e.printStackTrace(); // 예외 처리
        }

        // 로그 출력
        System.out.println("scheCnt의 개수: " + scheCnt);
        return scheCnt;
    }
    
    
    // 일정 조회 메서드 (특정 날짜의 일정)
    public List<ScheduleDTO> getSchedulesByDate(ScheduleDTO sche) {
    	 List<ScheduleDTO> scheduleList;
         try (SqlSession session = SqlSessionManager.getSqlSession().openSession()) {
             scheduleList = session.selectList("com.babystep.db.ScheduleMapper.getSchedulesByDate", sche);
         }
         return scheduleList;
     }
    
}
