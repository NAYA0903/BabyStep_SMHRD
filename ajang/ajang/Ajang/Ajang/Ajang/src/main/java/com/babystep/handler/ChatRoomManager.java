package com.babystep.handler;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.Session;

import com.babystep.db.SqlSessionManager;
import com.babystep.model.ChatMessageDAO;

public class ChatRoomManager {

    // 채팅방 리스트
    private static Map<String, Set<Session>> chatRooms = new ConcurrentHashMap<>();

    // 방 생성
    public static void createRoom(String roomId) {
        chatRooms.put(roomId, new CopyOnWriteArraySet<>());
    }
    
    public static Set<String> getRoomList() {
        return chatRooms.keySet();
    }

    // 방 삭제
    public static void removeRoom(String roomId) {
        chatRooms.remove(roomId);
    }

    // 방에 사용자 추가
    public static void joinRoom(String roomId, Session session) {
        chatRooms.get(roomId).add(session);
    }

    // 방에서 사용자 제거
    public static void leaveRoom(String roomId, Session session) {
        chatRooms.get(roomId).remove(session);
    }

    // 메시지 브로드캐스트
    public static void broadcast(String roomId, String message, Session sender) {
        Set<Session> sessions = chatRooms.get(roomId);
        for (Session session : sessions) {
            if (!session.equals(sender)) {
                try {
                    session.getBasicRemote().sendText(message);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    // 메시지 이력 로드 및 방에 브로드캐스트
    public static void loadMessageHistory(String roomId, Session session) {
        ChatMessageDAO dao = new ChatMessageDAO(SqlSessionManager.getSession());
        List<String> messageHistory = dao.getMessages(roomId);
        for (String message : messageHistory) {
            try {
                session.getBasicRemote().sendText(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
