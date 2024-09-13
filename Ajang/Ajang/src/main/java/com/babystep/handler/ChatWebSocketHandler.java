package com.babystep.handler ;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;

@ServerEndpoint("/chat/websocket/{roomTitle}")
public class ChatWebSocketHandler {

    // 방 별로 WebSocket 세션을 관리합니다.
    private static Map<String, Map<String, Session>> roomSessions = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("ROOM_TITLE") String roomTitle) {
        roomSessions.putIfAbsent(roomTitle, new ConcurrentHashMap<>());
        roomSessions.get(roomTitle).put(session.getId(), session);
        System.out.println("New connection to room " + roomTitle + " by session: " + session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("ROOM_TITLE") String roomTitle) {
        System.out.println("Message received in room " + roomTitle + ": " + message);
        // 해당 방의 모든 사용자에게 메시지를 브로드캐스트
        for (Session s : roomSessions.get(roomTitle).values()) {
            s.getAsyncRemote().sendText(message);
        }
    }

    @OnClose
    public void onClose(Session session, @PathParam("ROOM_TITLE") String roomTitle) {
        roomSessions.get(roomTitle).remove(session.getId());
        System.out.println("Connection closed in room " + roomTitle + " for session: " + session.getId());
    }
    
    
    

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.err.println("Error occurred in session: " + session.getId());
        throwable.printStackTrace();
    }
}
