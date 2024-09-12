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

@ServerEndpoint("/chat/websocket/{roomIdx}")
public class ChatWebSocketHandler {

    // 방 별로 WebSocket 세션을 관리합니다.
    private static Map<String, Map<String, Session>> roomSessions = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("ROOM_IDX") String roomIdx) {
        roomSessions.putIfAbsent(roomIdx, new ConcurrentHashMap<>());
        roomSessions.get(roomIdx).put(session.getId(), session);
        System.out.println("New connection to room " + roomIdx + " by session: " + session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("ROOM_IDX") String roomIdx) {
        System.out.println("Message received in room " + roomIdx + ": " + message);
        // 해당 방의 모든 사용자에게 메시지를 브로드캐스트
        for (Session s : roomSessions.get(roomIdx).values()) {
            s.getAsyncRemote().sendText(message);
        }
    }

    @OnClose
    public void onClose(Session session, @PathParam("ROOM_IDX") String roomIdx) {
        roomSessions.get(roomIdx).remove(session.getId());
        System.out.println("Connection closed in room " + roomIdx + " for session: " + session.getId());
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.err.println("Error occurred in session: " + session.getId());
        throwable.printStackTrace();
    }
}
