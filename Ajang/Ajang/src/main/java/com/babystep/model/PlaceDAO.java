package com.babystep.model;

import com.babystep.db.SqlSessionManager;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class PlaceDAO {
    private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    // 새로운 장소 등록
    public void createPlace(PlaceDTO place) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
            sqlSession.insert("PlaceMapper.createPlace", place);
        }
    }

    // ID로 장소 조회
    public PlaceDTO getPlace(Double placeIdx) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne("PlaceMapper.getPlace", placeIdx);
        }
    }

    // 모든 장소 조회
    public List<PlaceDTO> getAllPlaces() {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList("PlaceMapper.getAllPlaces");
        }
    }

    // 기존 장소 업데이트
    public void updatePlace(PlaceDTO place) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
            sqlSession.update("PlaceMapper.updatePlace", place);
        }
    }

    // 장소 삭제
    public void deletePlace(Double placeIdx) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
            sqlSession.delete("PlaceMapper.deletePlace", placeIdx);
        }
    }
}
