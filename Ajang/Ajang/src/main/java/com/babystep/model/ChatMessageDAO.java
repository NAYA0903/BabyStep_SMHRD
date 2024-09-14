package com.babystep.model;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

public class ChatMessageDAO {

    private SqlSession sqlSession;

    // SqlSession을 주입받는 생성자
    public ChatMessageDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    // 채팅 메시지를 저장하는 메서드
    public void saveMessage(String roomIdx, String message) {
        // MyBatis 매퍼에 정의된 쿼리를 호출합니다.
        ChatDTO chatMessage = new ChatDTO();
        chatMessage.setRoomIdx(Integer.parseInt(roomIdx));
        chatMessage.setChatContent(message);
        chatMessage.setChattedAt(new java.sql.Timestamp(System.currentTimeMillis())); // 메시지 전송 시간 설정
        sqlSession.insert("com.babystep.db.ChatMapper.insertChatMessage", chatMessage);
        sqlSession.commit(); // 트랜잭션 커밋
    }

    // 방의 메시지 목록을 가져오는 메서드
    public List<String> getMessages(String roomIdx) {
        // MyBatis 매퍼에 정의된 쿼리를 호출하여 메시지 목록을 가져옵니다.
        return sqlSession.selectList("com.babystep.db.ChatMapper.selectChatMessagesByRoomId", roomIdx);
    }
}
