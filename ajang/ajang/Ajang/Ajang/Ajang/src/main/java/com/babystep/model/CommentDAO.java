package com.babystep.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.babystep.db.SqlSessionManager;

public class CommentDAO {
    private SqlSession sqlSession;

    public CommentDAO() {
        this.sqlSession = SqlSessionManager.getSqlSession().openSession(true);
    }

    public void insertComment(CommentDTO comment) {
        try {
            sqlSession.insert("com.babystep.db.CommentMapper.insertComment", comment);
        } finally {
            sqlSession.close();
        }
    }
    
    // 댓글 목록 조회
    public List<CommentDTO> getCommentsByBoard(int boIdx) {
        List<CommentDTO> comments = null;
        try {
            comments = sqlSession.selectList("com.babystep.db.CommentMapper.getCommentsByBoard", boIdx);
            System.out.println("데이터1 : boIdx = " + boIdx);
            System.out.println("데이터2 : comments = " + comments);
        } finally {
            sqlSession.close();
        }
        return comments;
    }
}
