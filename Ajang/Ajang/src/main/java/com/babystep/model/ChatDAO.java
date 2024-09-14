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
        List<ChatDTO> messages = sqlSession.selectList("com.babystep.db.ChatMapper.selectChatMessagesByRoomId", roomIdx);
        System.out.println("Retrieved Messages: " + messages); // 로그 추가
        return messages;
    }
    public void deleteChatMessage(int chatIdx) {
        sqlSession.delete("com.babystep.db.ChatMapper.deleteChatMessage", chatIdx);
    }
}
