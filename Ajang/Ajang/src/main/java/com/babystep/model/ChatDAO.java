package com.babystep.model;

import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ChatDAO {

    private SqlSession sqlSession;

    public ChatDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public void insertChatMessage(ChatDTO chatMessage) {
        sqlSession.insert("com.babystep.db.ChatMapper.insertChatMessage", chatMessage);
        sqlSession.commit();  // 트랜잭션 커밋
    }

    public List<ChatDTO> selectChatMessagesByRoomId(int roomIdx) {
        System.out.println("roomIdx: " + roomIdx); // roomIdx 값 로그 확인
        
        List<ChatDTO> message = sqlSession.selectList("com.babystep.db.ChatMapper.selectChatMessagesByRoomId", roomIdx);
        System.out.println("Retrieved Messages: " + message); // 쿼리 결과 로그 확인
        return message;
    }
    
    public void deleteChatMessage(int chatIdx) {
        sqlSession.delete("com.babystep.db.ChatMapper.deleteChatMessage", chatIdx);
    }
}
