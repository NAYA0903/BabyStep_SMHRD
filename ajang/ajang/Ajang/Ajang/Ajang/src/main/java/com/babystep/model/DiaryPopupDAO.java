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

      System.out.println("cnt\uc758 \uac1c\uc218" + cnt);
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

      System.out.println("DAO\uc5d0\uc11c \uc870\ud68c\ub41c \ub370\uc774\ud130: " + String.valueOf(diaryList));
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
         System.out.println(" \ub370\uc774\ud130 4 - detaildiary: " + String.valueOf(detaildiary));
         if (detaildiary == null) {
            ArrayList var7 = new ArrayList();
            return var7;
         }
      } finally {
         if (session != null) {
            session.close();
         }

      }

      return detaildiary;
   }
}
