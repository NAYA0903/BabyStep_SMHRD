package com.babystep.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.babystep.db.SqlSessionManager;

public class BoardDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	public int writeBoard(BoardDTO vo) {
		int cnt = 0;
		try {
			cnt = sqlSession.insert("com.babystep.db.BoardMapper.writeBoard", vo);
		} catch (Exception e) {
			e.printStackTrace(); // 예외 처리
			// TODO: handle exception
		} finally {
			sqlSession.close();
		}
		System.out.println("cnt의 개수" + cnt);
		return cnt;
	}

	public List<BoardDTO> allBoard() {
		List<BoardDTO> boards = null; // 빈 리스트로 초기화
		System.out.println("allboard 도달");
		System.out.println(boards);
		try {
			boards = sqlSession.selectList("com.babystep.db.BoardMapper.allBoard");
			System.out.println("게시글 개수: " + boards.size()); // 로그 출력
		} catch (Exception e) {
			e.printStackTrace(); // 예외 처리
		} finally {
			sqlSession.close();
		}
		System.out.println("조회된 데이터: " + boards);
		return boards;
	}

// 게시글 상세 조회
	public BoardDTO detailBoard(int num) {
		BoardDTO board = null;
		try {
			board = sqlSession.selectOne("com.babystep.db.BoardMapper.detailBoard", num);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sqlSession.close();
		}
		return board;
	}

	public void increaseBoardHit(int boIdx) {
		try {
			sqlSession.update("com.babystep.db.BoardMapper.boardHit", boIdx);
			sqlSession.commit(); // 트랜잭션 커밋
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	// ***************** 검색 기능 메서드 *****************
	public List<BoardDTO> searchBoard(String field, String searchText) {
	    List<BoardDTO> results = null;
	    String queryField;

	    switch (field) {
	        case "BO_TITLE":
	            queryField = "BO_TITLE";
	            break;
	        case "BO_CONTENT":
	            queryField = "BO_CONTENT";
	            break;
	        default:
	            throw new IllegalArgumentException("Invalid search field: " + field);
	    }

	    // 검색어에 % 추가
	    final String modifiedSearchText = "%" + searchText + "%";

	    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
	        results = sqlSession.selectList("com.babystep.db.BoardMapper.searchBoard", 
	                                         new HashMap<String, Object>() {{
	                                             put("field", queryField);
	                                             put("value", modifiedSearchText);
	                                         }});
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return results;
	}




	// ***************** 검색 기능 메서드 *****************


}
