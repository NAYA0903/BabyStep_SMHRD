// Source code is decompiled from a .class file using FernFlower decompiler.
package com.babystep.model;

import com.babystep.db.SqlSessionManager;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class DiaryPopupDAO {
   SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
   SqlSession sqlSession;

   public DiaryPopupDAO() {
      this.sqlSession = this.sqlSessionFactory.openSession(true);
   }

   public int insertdiary(DiaryPopupDTO vo) {
      int cnt = 0;

      try {
         cnt = this.sqlSession.insert("com.babystep.db.DiaryPopupMapper.insertdiary", vo);
      } catch (Exception var7) {
         var7.printStackTrace();
      } finally {
         this.sqlSession.close();
      }

      System.out.println("cnt" + cnt);
      return cnt;
   }

   public List<DiaryPopupDTO> alldiary(String USER_ID) {
      List<DiaryPopupDTO> diaryList = null;

      try {
         diaryList = this.sqlSession.selectList("com.babystep.db.DiaryPopupMapper.alldiary", USER_ID);
      } catch (Exception var7) {
         var7.printStackTrace();
      } finally {
         if (this.sqlSession != null) {
            this.sqlSession.close();
         }

      }

      System.out.println("DAO " +diaryList);
      return diaryList;
   }
   public List<DiaryPopupDTO> detaildiary(String USER_ID, String selectedDate) {
	    try (SqlSession session = SqlSessionManager.getSession()) {
	        Map<String, Object> paraMap = new HashMap<>();
	        paraMap.put("USER_ID", USER_ID);
	        paraMap.put("selectedDate", selectedDate);
	        
	        List<DiaryPopupDTO> detaildiary = session.selectList("com.babystep.db.DiaryPopupMapper.detaildiary", paraMap);
	        System.out.println("detaildiary: " + detaildiary);
	        
	        return detaildiary != null ? detaildiary : Collections.emptyList();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return Collections.emptyList(); // 예외가 발생한 경우에도 빈 리스트 반환
	    }
	}

   
   public int babyage(String USER_ID) {
	    int babyage = 0;
	    try (SqlSession session = SqlSessionManager.getSession()) {
	        System.out.println("USER_ID: " + USER_ID);
	        babyage = session.selectOne("com.babystep.db.DiaryPopupMapper.babyage", USER_ID);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return babyage;
	}

	
	

}
