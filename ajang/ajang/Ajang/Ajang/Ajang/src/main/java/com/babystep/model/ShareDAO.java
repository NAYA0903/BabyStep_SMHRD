package com.babystep.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class ShareDAO {
    private SqlSessionFactory sqlSessionFactory;

    public ShareDAO(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    // 공유 정보 추가 메서드
    public int addShare(ShareDTO share) {
        int result = 0;
        try (SqlSession session = sqlSessionFactory.openSession()) {
            result = session.insert("com.babystep.db.ShareMapper.addShare", share);
            session.commit(); // 트랜잭션 커밋
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}