package com.babystep.model;

import java.util.List;

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

	   public DiaryPopupDTO detaildiary(int DI_IDX) {
		    DiaryPopupDTO Diarys = null;
		    try {
		        Diarys = sqlSession.selectOne("com.babystep.db.DiaryPopupMapper.detaildiary", DI_IDX);
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        sqlSession.close();
		    }
		    return Diarys;
		}
		   }


		   
	   
 

