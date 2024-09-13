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
    }

    public List<ChatDTO> selectChatMessagesByRoomId(int roomIdx) {
        return sqlSession.selectList("com.babystep.db.ChatMapper.selectChatMessagesByRoomId", roomIdx);
    }

    public void deleteChatMessage(int chatIdx) {
        sqlSession.delete("com.babystep.db.ChatMapper.deleteChatMessage", chatIdx);
    }
}
