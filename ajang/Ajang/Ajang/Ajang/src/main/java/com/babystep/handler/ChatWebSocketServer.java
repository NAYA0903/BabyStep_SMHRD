package com.babystep.handler;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
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
    private static ConcurrentHashMap<Integer, Set<Session>> roomSessions = new ConcurrentHashMap<>();
    private static ChatDAO chatDAO = new ChatDAO(SqlSessionManager.getSqlSession().openSession());

    @OnOpen
    public void onOpen(Session session, @PathParam("roomIdx") int roomIdx) {
        HttpSession httpSession = (HttpSession) session.getUserProperties().get("httpSession");

        // 방에 대한 세션을 관리하는 Set을 가져옴
        roomSessions.putIfAbsent(roomIdx, ConcurrentHashMap.newKeySet());
        roomSessions.get(roomIdx).add(session);

        // 현재 방에 접속한 인원 수 출력
        int memberCount = roomSessions.get(roomIdx).size();
        System.out.println("Room " + roomIdx + " has " + memberCount + " members.");

        // 방 인원 수를 다른 클라이언트들에게 전송
        broadcastMemberCount(roomIdx, memberCount);

        if (httpSession == null) {
            System.out.println("HttpSession is null - Handshake failed to capture the session.");
            closeSession(session);
            return;
        }

        String userId = (String) httpSession.getAttribute("id");
        String enterMessage = userId + "님이 입장하셨습니다.";

        if (userId != null) {
            userIds.put(session, userId);
            roomIdxes.put(session, roomIdx);
            System.out.println(userId + " has joined room: " + roomIdx);

            // 방에 있는 모든 사용자에게 입장 메시지 브로드캐스트
            broadcastWelcomeMessage(roomIdx, enterMessage);

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
            closeSession(session);
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

    private void broadcastMemberCount(int roomIdx, int memberCount) {
        Set<Session> sessions = roomSessions.get(roomIdx);
        if (sessions != null) {
            for (Session session : sessions) {
                if (session.isOpen()) {  // 세션이 열려 있는지 확인
                    try {
                        session.getBasicRemote().sendText("memberCount:" + memberCount);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                } else {
                    System.out.println("세션이 이미 닫혔습니다: " + session.getId());
                }
            }
        }
    }

    private void broadcastMessage(int roomIdx, String message, Session senderSession) {
        Set<Session> sessions = roomSessions.get(roomIdx);
        if (sessions != null) {
            for (Session session : sessions) {
                if (session.isOpen()) {  // 세션이 열려 있는지 확인
                    try {
                        session.getBasicRemote().sendText(message);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                } else {
                    System.out.println("세션이 이미 닫혔습니다: " + session.getId());
                }
            }
        }
    }

    private void broadcastWelcomeMessage(int roomIdx, String message) {
        Set<Session> sessions = roomSessions.get(roomIdx);
        if (sessions != null) {
            for (Session session : sessions) {
                if (session.isOpen()) {
                    session.getAsyncRemote().sendText(message);  // 비동기적으로 메시지 전송
                } else {
                    System.out.println("세션이 이미 닫혔습니다: " + session.getId());
                }
            }
        }
    }

    // 세션을 안전하게 닫는 메서드
    private void closeSession(Session session) {
        try {
            session.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
