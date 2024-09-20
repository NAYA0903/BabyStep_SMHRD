package com.babystep.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.babystep.db.SqlSessionManager;

public class HolidayDAO {
    
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();  
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
    public List<HolidayDTO> getHolidaysByMonth(int year, int month) {
    	
        SqlSession session = sqlSessionFactory.openSession();
        
        try {
            HashMap<String, Integer> paramMap = new HashMap<>();
            paramMap.put("year", year);
            paramMap.put("month", month);
            
            List<HolidayDTO> holidays = sqlSession.selectList("com.babystep.db.HolidayMapper.getHolidaysByMonth", paramMap);
            
            if (holidays == null) {
                
                return new ArrayList<>();  
            }                  

            return holidays;
            
        } finally {
            session.close();
        }
    }
}
