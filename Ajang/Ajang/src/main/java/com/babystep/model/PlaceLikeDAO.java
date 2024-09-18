package com.babystep.model;

import com.babystep.db.SqlSessionManager;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class PlaceLikeDAO {
    private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    // 찜한 장소 등록
    public void createFavorite(PlaceLikeDTO favorite) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
            sqlSession.insert("PlaceLikeMapper.createFavorite", favorite);
        }
    }

    // ID로 찜한 장소 조회
    public PlaceLikeDTO getFavorite(Double favIdx) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectOne("PlaceLikeMapper.getFavorite", favIdx);
        }
    }

    // 사용자 ID로 찜한 장소 목록 조회
    public List<PlaceLikeDTO> getFavoritesByUser(String userId) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList("PlaceLikeMapper.getFavoritesByUser", userId);
        }
    }

    // 찜한 장소 업데이트
    public void updateFavorite(PlaceLikeDTO favorite) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
            sqlSession.update("PlaceLikeMapper.updateFavorite", favorite);
        }
    }

    // 찜한 장소 삭제
    public void deleteFavorite(Double favIdx) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
            sqlSession.delete("PlaceLikeMapper.deleteFavorite", favIdx);
        }
    }
    
    // 추가된 메서드
    public List<PlaceDTO> getFavoritePlacesByUser(String userId) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            return sqlSession.selectList("PlaceLikeMapper.getFavoritesByUser", userId);
        }
    }

    
}
