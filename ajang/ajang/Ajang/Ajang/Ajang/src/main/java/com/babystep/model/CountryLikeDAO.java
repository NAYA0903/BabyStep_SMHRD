package com.babystep.model;

import org.apache.ibatis.cache.Cache;
import org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock.Catch;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.babystep.db.SqlSessionManager;

public class CountryLikeDAO {


	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	   // 좋아요 수 증가
    public int addLikeCountry(CountryLikeDTO dto) {
        int cnt = 0;
        try {
        	// TB_USED 테이블에서 좋아요 수 증가
        	sqlSession.update("com.babystep.db.CountryLikeMapper.UpdateLike", dto);
        	// TB_USEDLIKE 테이블에 좋아요 기록 추가
          cnt = sqlSession.insert("com.babystep.db.CountryLikeMapper.addLikeCountry", dto);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {	
            sqlSession.close();
        }
        return cnt;
    }
	
	// 좋아요 수 감소
	public int unaddLikeCountry(CountryLikeDTO dto) {
		int cnt = 0;
	    try {
            // 매퍼에서 정의한 SQL 쿼리를 호출하여 TB_USED 테이블에서 좋아요 수를 1 감소시킵니다.
            sqlSession.update("com.babystep.db.CountryLikeMapper.DeleteCountry", dto);
            // TB_USEDLIKE 테이블에서 좋아요 기록을 삭제하는 쿼리 실행
            cnt = sqlSession.delete("com.babystep.db.CountryLikeMapper.DeleteLike", dto);
        } catch (Exception e) {
            e.printStackTrace();  // 예외가 발생하면 스택 트레이스를 출력합니다.
        } finally {
            // SQL 세션을 닫아 자원을 해제합니다.
            sqlSession.close();
        }
        return cnt ;  // 좋아요 취소 결과를 반환합니다.
    }

	    // 사용자가 특정 게시물에 좋아요를 눌렀는지 확인하는 메서드
	public boolean isLikedByUser(String USER_ID, int USED_IDX) {
	    try {
	        Integer likeId = sqlSession.selectOne("com.babystep.db.CountryLikeMapper.StateCountry", 
	                    new CountryLikeDTO(0, USER_ID, USED_IDX)); // 좋아요 여부 확인
	        return likeId != null; // 좋아요가 있으면 true, 없으면 false
	    } finally {
	        sqlSession.close();
	    }
	
	}
	}

