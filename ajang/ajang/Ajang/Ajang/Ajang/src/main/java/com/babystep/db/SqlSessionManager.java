package com.babystep.db;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {

	public static SqlSessionFactory sqlSessionFactory;

	// 초기화 블럭 : static{} -> 프로그램 시작과 동시에 무조건 셋팅되어 시작되는 구조!
	static {
		try {

			String resource = "com/babystep/db/Mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 초기화 단계에서 생성된 sqlSessionFactory 결과를 반환하는 메소드 생성!
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
	
	// SqlSession을 반환하는 메서드 (트랜잭션 관리 필요 시 사용)!
	public static SqlSession getSession() {
		return sqlSessionFactory.openSession();
	}
	
	
}
