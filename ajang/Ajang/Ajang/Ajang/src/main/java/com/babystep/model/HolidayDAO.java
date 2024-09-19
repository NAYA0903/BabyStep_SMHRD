package com.babystep.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.babystep.db.SqlSessionManager;

public class HolidayDAO {
    
//    private SqlSessionFactory sqlSessionFactory;
	
//    public HolidayDAO() {
//        sqlSessionFactory = SqlSessionManager.getSqlSession();
//    }
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();  
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
    public List<HolidayDTO> getHolidaysByMonth(int year, int month) {
    	
        SqlSession session = sqlSessionFactory.openSession();
        
        try {
            HashMap<String, Integer> paramMap = new HashMap<>();
            paramMap.put("year", year);
            paramMap.put("month", month);
            
            System.out.println("DAO" + year);
            System.out.println(month);
            System.out.println(paramMap);

            List<HolidayDTO> holidays = sqlSession.selectList("com.babystep.db.HolidayMapper.getHolidaysByMonth", paramMap);
            
            
            System.out.println("데이터2 : " + holidays);
            
            if (holidays == null) {
            	System.out.println("데이터3 : " + holidays);
                
                return new ArrayList<>();  // null이 반환되면 빈 리스트로 대체
            }                  

            return holidays;
        } finally {
            session.close();
        }
    }
}
