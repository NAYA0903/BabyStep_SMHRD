package com.babystep.model;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.babystep.db.SqlSessionManager;

public class CountryDAO {
    SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    // 중고나라 게시물 작성
    public int writeCountry(CountryDTO vo) {
        int cnt = 0;
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
            cnt = sqlSession.insert("com.babystep.db.CountryMapper.writeCountry", vo);
            System.out.println("게시글 작성 cnt: " + cnt);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cnt;
    }

    // 게시물 개수 조회
    public List<CountryDTO> allCountry() {
        List<CountryDTO> countrys = null;
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            countrys = sqlSession.selectList("com.babystep.db.CountryMapper.allCountry");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return countrys;
    }

    // 게시글 상세 조회
    public CountryDTO detailCountry(int num) {
        CountryDTO country = null;
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            country = sqlSession.selectOne("com.babystep.db.CountryMapper.detailCountry", num);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return country;
    }

  
}
