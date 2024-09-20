package com.babystep.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.babystep.db.SqlSessionManager;

public class DiaryPopupDAO {
	
	  SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	   SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	   
	   public int insertdiary(DiaryPopupDTO vo) {
		int cnt = 0;
		try {
			cnt = sqlSession.insert("com.babystep.db.DiaryPopupMapper.insertdiary", vo);
	    } catch (Exception e) {
      	  e.printStackTrace(); // 예외 처리
          // TODO: handle exception
       }finally {
          sqlSession.close();
       }
       System.out.println("cnt의 개수" + cnt);
       return cnt;
    }
	   
	   public List<DiaryPopupDTO> alldiary() {
		   List<DiaryPopupDTO> Diary = null ;
		   try {
			   Diary = sqlSession.selectList("com.babystep.db.DiaryPopupMapper.alldiary") ;
		   } catch (Exception e) {
		        e.printStackTrace(); // 예외 처리
		    } finally {
		        sqlSession.close();
		    }
		    System.out.println("조회된 데이터: " + Diary);
		    return Diary;
		}
	   
	   public List<DiaryPopupDTO> detaildiary(String USER_ID, String selectedDate) {
		    SqlSession session = null; // MyBatis의 SqlSession을 선언 (데이터베이스와의 통신을 위한 객체)
		    List<DiaryPopupDTO> detaildiary = null; // 조회된 DiaryPopupDTO 객체들을 담을 리스트 선언
		    
		    try {
		        session = SqlSessionManager.getSession(); // SqlSessionManager로부터 세션을 얻어옴 (데이터베이스 연결)
		        
		        // 쿼리에 전달할 매개변수를 담는 Map 생성
		        Map<String, Object> paraMap = new HashMap<>();
		        paraMap.put("USER_ID", USER_ID); // 사용자 ID를 Map에 추가
		        paraMap.put("selectedDate", selectedDate); // 선택한 날짜를 Map에 추가
		        
		        // detaildiary 쿼리를 실행하고 결과를 리스트에 저장
		        detaildiary = sqlSession.selectOne("com.babystep.db.DiaryPopupMapper.detaildiary", paraMap);
		        
		    } finally {
		        // 세션이 null이 아닐 경우, 세션을 닫아 데이터베이스 자원을 해제
		        if (session != null) {
		            session.close(); // 세션 닫기
		        }
		    }
		    
		    // 조회된 결과 반환
		    return detaildiary;
		}

	   
}

