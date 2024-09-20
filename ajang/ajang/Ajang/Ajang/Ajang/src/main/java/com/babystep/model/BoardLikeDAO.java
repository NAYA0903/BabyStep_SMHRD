package com.babystep.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.babystep.db.SqlSessionManager;

public class BoardLikeDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	// 좋아요 수 증가
	public int addLikeBoard(BoardLikeDTO dto) {
		int cnt = 0 ;
		try {
			// TB_BOARD 테이블에서 좋아요 증가
			sqlSession.update("com.babystep.db.BoardLikeMapper.UpdateLike", dto);
			// TB_BOARD 테이블에 좋아요 증가한 게시물 데이터 넣어주기
			cnt = sqlSession.insert("com.babystep.db.BoardLikeMapper.addBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
			sqlSession.close();
		return cnt;
	}

	// 좋아요 수 감소
	public int unaddLikeBoard(BoardLikeDTO dto) {
		int cnt = 0 ;
		try {
			// TB_BOARD 테이블에서 좋아요 감소
			sqlSession.update("com.babystep.db.BoardLikeMapper.DeleteLike", dto) ;
			// TB_BOARD 테이블에서 좋아요 감소한 게시물 데이터 빼기 
			cnt = sqlSession.delete("com.babystep.db.BoardLikeMapper.DeleteBoard", dto) ;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}
	
	// 사용자가 특정 게시물에 좋아요를 눌렀는지 확인하는 메소드
	public boolean isLikedByUser(int BO_IDX, String USER_ID) {
		try {
			Integer likeId = sqlSession.selectOne("com.babystep.db.BoardLikeMapper.StateBoard",
					new BoardLikeDTO(0,BO_IDX,USER_ID));
			return likeId != null;
			
		 } finally {
		        sqlSession.close();
		}
		
	}
	
}
