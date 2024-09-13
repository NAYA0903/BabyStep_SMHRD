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

@ServerEndpoint("/chat/{roomId}/{nickname}")
public class ChatWebSocketServer {

    private static ConcurrentHashMap<Session, String> nicknames = new ConcurrentHashMap<>();
    private static ChatDAO chatDAO = new ChatDAO(SqlSessionManager.getSqlSession().openSession());

    @OnOpen
    public void onOpen(Session session, @PathParam("roomId") int roomId, @PathParam("nickname") String nickname) {
        nicknames.put(session, nickname);
        System.out.println(nickname + " has joined room: " + roomId);
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("roomId") int roomId) {
        String nickname = nicknames.get(session);
        String fullMessage = nickname + ": " + message;

        // 채팅 메시지를 저장
        ChatDTO chatMessage = new ChatDTO();
        chatMessage.setRoomIdx(roomId);
        chatMessage.setUserId(nickname);
        chatMessage.setChatContent(fullMessage);
        chatDAO.insertChatMessage(chatMessage);

        // 메시지 브로드캐스트
        broadcastMessage(roomId, fullMessage, session);
    }

    @OnClose
    public void onClose(Session session) {
        nicknames.remove(session);
        System.out.println("Session closed: " + session.getId());
    }

    private void broadcastMessage(int roomId, String message, Session senderSession) {
        for (Session session : nicknames.keySet()) {
            if (session.isOpen() && !session.equals(senderSession)) {
                try {
                    session.getBasicRemote().sendText(message);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

