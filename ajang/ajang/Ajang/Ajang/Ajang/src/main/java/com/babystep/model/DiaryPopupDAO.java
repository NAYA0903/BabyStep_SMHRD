// Source code is decompiled from a .class file using FernFlower decompiler.
package com.babystep.model;

import com.babystep.db.SqlSessionManager;
import java.util.ArrayList;
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
      SqlSession session = null;
      List<DiaryPopupDTO> detaildiary = null;

      try {
         session = SqlSessionManager.getSession();
         Map<String, Object> paraMap = new HashMap();
         paraMap.put("USER_ID", USER_ID);
         paraMap.put("selectedDate", selectedDate);
         detaildiary = this.sqlSession.selectList("com.babystep.db.DiaryPopupMapper.detaildiary", paraMap);
         System.out.println("detaildiary: " +detaildiary);
         if (detaildiary == null) {
            ArrayList var = new ArrayList();
            return var;
         }
      } finally {
         if (session != null) {
            session.close();
         }

      }

      return detaildiary;
   }
   
   public int babyage (String USER_ID) {
       // SqlSession을 생성
       SqlSession session = sqlSessionFactory.openSession();
       int babyage = 0 ;
       try {
    	   System.out.println("USER_ID" + USER_ID);
	 babyage = session.selectOne("com.babystep.db.DiaryPopupMapper.babyage", USER_ID) ;
       } finally {
           session.close(); // 세션을 반드시 닫아야 함
	} 
       return babyage ;
   }
}
