package com.babystep.model;

import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ChatRoomDAO {

    private SqlSession sqlSession;

    public ChatRoomDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public void insertChatRoom(ChatRoomDTO chatRoom) {
        sqlSession.insert("com.babystep.db.ChatRoomMapper.insertChatRoom", chatRoom);
    }

    public ChatRoomDTO selectChatRoomById(int roomIdx) {
        return sqlSession.selectOne("com.babystep.db.ChatRoomMapper.selectChatRoomById", roomIdx);
    }

    public List<ChatRoomDTO> selectAllChatRooms() {
        return sqlSession.selectList("com.babystep.db.ChatRoomMapper.selectAllChatRooms");
    }

    public void deleteChatRoom(int roomIdx) {
        sqlSession.delete("com.babystep.db.ChatRoomMapper.deleteChatRoom", roomIdx);
    }
}
