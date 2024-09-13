package com.babystep.handler;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.babystep.db.SqlSessionManager;
import com.babystep.model.ChatDAO;
import com.babystep.model.ChatDTO;

@ServerEndpoint("/chat/{roomIdx}/{userId}")
public class ChatWebSocketServer {

    private static ConcurrentHashMap<Session, String> userIds = new ConcurrentHashMap<>();
    private static ConcurrentHashMap<Session, Integer> roomIdxes = new ConcurrentHashMap<>();
    private static ChatDAO chatDAO = new ChatDAO(SqlSessionManager.getSqlSession().openSession());

    @OnOpen
    public void onOpen(Session session, @PathParam("roomIdx") int roomIdx, @PathParam("userId") String userId) {
    	userIds.put(session, userId);
    	roomIdxes.put(session, roomIdx);
        System.out.println(userId + " has joined room: " + roomIdx);
    }
    
    @OnMessage
    public void onMessage(String message, Session session, @PathParam("roomIdx") int roomId) {
        String userId = userIds.get(session);
        String fullMessage = userId + ": " + message;

        // 채팅 메시지를 저장
        ChatDTO chatMessage = new ChatDTO();
        chatMessage.setRoomIdx(roomId); // roomIdx를 가져옴
        chatMessage.setUserId(userId);
        chatMessage.setChatContent(fullMessage);
        chatDAO.insertChatMessage(chatMessage);

        // 메시지 브로드캐스트
        broadcastMessage(roomId, fullMessage, session);
    }
    
    @OnClose
    public void onClose(Session session) {
    	userIds.remove(session);
        System.out.println("Session closed: " + session.getId());
    }

    private void broadcastMessage(int roomIdx, String message, Session senderSession) {
        for (Session session : userIds.keySet()) {
            if (session.isOpen() && !session.equals(senderSession)) {
                int currentRoomIdx = roomIdxes.get(session); // 각 세션의 roomIdx를 확인
                if (currentRoomIdx == roomIdx) { // 같은 roomIdx일 때만 전송
                    try {
                        session.getBasicRemote().sendText(message);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
}