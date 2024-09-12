package com.babystep.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.babystep.db.SqlSessionManager;

public class CountryDAO {
	  SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	   SqlSession sqlSession = sqlSessionFactory.openSession(true);
	   
	   // 중고나라 게시물 작성
	   public int writeCountry(CountryDTO vo)  {
		   int cnt = 0 ;
		   System.out.println("vo는" + vo);
		   try {
			cnt = sqlSession.insert("com.babystep.db.CountryMapper.writeCountry", vo);
			System.out.println("cnt는" + cnt);
		
		} catch (Exception e) {
			// TODO: handle exception
		  }finally {
            sqlSession.close();
         }
		    System.out.println("cnt의 개수" + cnt);
	         return cnt;
	   }
	   
	   // 게시물 개수 조회
	   public List<CountryDTO> allCountry() {
		   List<CountryDTO> countrys = null ;
		   System.out.println("allCountry 도달");
		    try {
		    	countrys = sqlSession.selectList("com.babystep.db.CountryMapper.allCountry");
		        System.out.println("게시글 개수: " + countrys.size()); // 로그 출력
		    } catch (Exception e) {
		        e.printStackTrace(); // 예외 처리
		    } finally {
		        sqlSession.close();
		    }
		    System.out.println("조회된 데이터: " + countrys);
		    return countrys;
		}
	// 게시글 상세 조회
		public CountryDTO detailCountry(int num) {
			CountryDTO country = null;
			try {
				country 
				= sqlSession.selectOne("com.babystep.db.CountryMapper.detailCountry", num);
			} catch (Exception e) {
				// TODO: handle exception
			}finally {
				sqlSession.close();
			}
			return country;
		}
		   
		   
	   }
	   
