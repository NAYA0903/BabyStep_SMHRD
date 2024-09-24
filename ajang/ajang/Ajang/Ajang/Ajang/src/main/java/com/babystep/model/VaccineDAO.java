package com.babystep.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.babystep.db.SqlSessionManager;

public class VaccineDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public List<VaccineDTO> babyageselect(Integer babyage){
		List<VaccineDTO> age = sqlSession.selectList("com.babystep.db.VaccineMapper.babyageselect" , babyage) ;
		
		sqlSession.close();
		
		return age ;
	}
	

}
