package com.babystep.model;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class BabyDAO {
	
	private SqlSessionFactory sqlSessionFactory;
	
	// SqlSessionFactory를 매개변수로 받는 생성자 추가
    public BabyDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    // 일정 추가하는 메서드
    public int addBaby(BabyDTO baby) {

        int babyCnt = 0;

        // try-with-resources 구문에서 자동으로 세션을 닫음
        try (SqlSession session = sqlSessionFactory.openSession()) {

            // MyBatis 매퍼 호출
        	babyCnt = session.insert("com.babystep.db.BabyMapper.addBaby", baby);

            // 트랜잭션 커밋
            session.commit();

        } catch (Exception e) {
            e.printStackTrace(); // 예외 처리
        }

        // 로그 출력
        System.out.println("scheCnt의 개수: " + babyCnt);
        return babyCnt;
    }
    
    
    // 아기 개월수 업데이트 후 값을 반환하는 메서드
       public String upbabyage(String USER_ID, String selectedDate) {
       	String addage = null;
           try (SqlSession session = sqlSessionFactory.openSession(true)) {
               Map<String, Object> paramMap = new HashMap<>();
               paramMap.put("USER_ID", USER_ID);
               paramMap.put("selectedDate", selectedDate);
               
               System.out.println("USER_ID" + USER_ID);
               System.out.println("selectedDate"+ selectedDate);
              
               addage = session.selectOne("com.babystep.db.BabyMapper.upbabyage", paramMap);
               if (addage == null) {
                   System.out.println("No result found for the query.");
               } else {
                   System.out.println("Result: " + addage);
               }
               session.commit();
           } catch (Exception e) {
               e.printStackTrace();
           }
           return addage;
       }

   
}
