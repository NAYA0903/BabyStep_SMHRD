package com.babystep.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.babystep.db.SqlSessionManager;

public class UserDAO {
	
	// 데이터베이스에 연결하여 쓸 수 있는 기능 작업!
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	// 회원가입 메소드 생성!
	public int Register(UserDTO dto) {
		
		// 2. sql문장 전달!
		int result = sqlSession.insert("register", dto);
		
		// 3. 결과 처리
		if(result > 0) {
			System.out.println("회원 가입 성공!");
		}
		
		// 4. sqlSession 반납!
		sqlSession.close();
		
		return result;

	}
	
	    // 사용자가 로그인을 했는지 판단하는 메소드
		public UserDTO login(UserDTO dto) {
			
			// 전체 테이블중 일부분만 확인할 수 있는 selectOne() 사용!
			UserDTO result = sqlSession.selectOne("login", dto);
			
			sqlSession.close();
			
			return result;
			
			
		}
		
		// 사용자 ID로 해싱된 비밀번호 가져오기 (로그인에 사용)
	    public String getPasswordById(String id) {
	        // SqlSession을 생성
	        SqlSession session = sqlSessionFactory.openSession();

	        String storedPassword = null;
	        try {
	            // MyBatis 매퍼에서 getPasswordById 쿼리 실행
	            storedPassword = session.selectOne("com.babystep.db.UserMapper.getPasswordById", id);
	        } finally {
	            session.close(); // 세션을 반드시 닫아야 함
	        }
	        return storedPassword;
	    }

		
	 // 닉네임으로 사용
	    public String getNicknameById(String id) {
	        // SqlSession을 생성
	        SqlSession session = sqlSessionFactory.openSession();

	        String storedNickname = null;
	        try {
	            // MyBatis 매퍼에서 getPasswordById 쿼리 실행
	            storedNickname = session.selectOne("com.babystep.db.UserMapper.getNicknameById", id);
	        } finally {
	            session.close(); // 세션을 반드시 닫아야 함
	        }
	        return storedNickname;
	    }

		
	public String getsysdate(String sysdate) {
		 SqlSession session = sqlSessionFactory.openSession();

	        String joindate = null;
	        try {
	            // MyBatis 매퍼에서 getPasswordById 쿼리 실행
	        	joindate = session.selectOne("com.babystep.db.UserMapper.getsysdate", sysdate);
	        } finally {
	            session.close(); // 세션을 반드시 닫아야 함
	        }
	        return joindate;
	    }
	
	
	public List<CountryDTO> getUsedLike(String userId) {
	    SqlSession session = sqlSessionFactory.openSession();
	    List<CountryDTO> likedItems = null;
	    try {
	        likedItems = session.selectList("com.babystep.db.UserMapper.getUsedLike", userId);
	    } finally {
	        session.close();
	    }
	    return likedItems;
	}



}
	
	

	

