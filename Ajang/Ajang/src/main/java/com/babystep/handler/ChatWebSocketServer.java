package com.babystep.handler ;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.babystep.config.HttpSessionConfigurator;
import com.babystep.db.SqlSessionManager;
import com.babystep.model.ChatDAO;
import com.babystep.model.ChatDTO;

@ServerEndpoint(value = "/chat/{roomIdx}", configurator = HttpSessionConfigurator.class)
public class ChatWebSocketServer {

    private static ConcurrentHashMap<Session, String> userIds = new ConcurrentHashMap<>();
    private static ConcurrentHashMap<Session, Integer> roomIdxes = new ConcurrentHashMap<>();
    private static ChatDAO chatDAO = new ChatDAO(SqlSessionManager.getSqlSession().openSession());

    @OnOpen
    public void onOpen(Session session, @PathParam("roomIdx") int roomIdx) {
        HttpSession httpSession = (HttpSession) session.getUserProperties().get("httpSession");
        String userId = (String) httpSession.getAttribute("id");

        if (userId != null) {
            userIds.put(session, userId);
            roomIdxes.put(session, roomIdx);
            System.out.println(userId + " has joined room: " + roomIdx);
            
            // 채팅방 이전 메시지 불러오기
            List<ChatDTO> messages = chatDAO.selectChatMessagesByRoomId(roomIdx);
            
            // 이전 메시지를 클라이언트에 전송
            if (messages != null && !messages.isEmpty()) {
                try {
                    for (ChatDTO chatMessage : messages) {
                        if (chatMessage != null && chatMessage.getUserId() != null) {
                            session.getBasicRemote().sendText(chatMessage.getUserId() + ": " + chatMessage.getChatContent());
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } else {
            try {
                session.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    
    @OnMessage
    public void onMessage(String message, Session session) {
        String userId = userIds.get(session);
        int roomIdx = roomIdxes.get(session);
        
        // 현재 시간 포함한 Timestamp 생성
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        
        String fullMessage = userId + ": " + message;

        // 채팅 메시지 저장
        ChatDTO chatMessage = new ChatDTO();
        chatMessage.setRoomIdx(roomIdx);
        chatMessage.setUserId(userId);
        chatMessage.setChatContent(message);
        chatMessage.setChattedAt(currentTime);
        chatDAO.insertChatMessage(chatMessage);

        // 같은 roomIdx에 있는 사용자에게 메시지 전송
        broadcastMessage(roomIdx, fullMessage, session);
    }

    private void broadcastMessage(int roomIdx, String message, Session senderSession) {
        for (Session session : userIds.keySet()) {
            if (session.isOpen()) {  // 모든 세션에 메시지 전송
                int currentRoomIdx = roomIdxes.get(session);
                if (currentRoomIdx == roomIdx) {
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
