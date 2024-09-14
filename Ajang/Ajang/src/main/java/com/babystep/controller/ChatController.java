package com.babystep.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babystep.db.SqlSessionManager;
import com.babystep.model.ChatDAO;
import com.babystep.model.ChatDTO;

@WebServlet("/chatController")
public class ChatController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ChatDAO chatDAO = new ChatDAO(SqlSessionManager.getSqlSession().openSession());

    // GET: 채팅방의 모든 메시지 불러오기
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomIdx = Integer.parseInt(request.getParameter("roomIdx"));
        List<ChatDTO> messages = chatDAO.selectChatMessagesByRoomId(roomIdx);
        request.setAttribute("messages", messages);
        request.getRequestDispatcher("chatRoom.jsp").forward(request, response);
    }

    // POST: 채팅 메시지 저장
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = (String) request.getSession().getAttribute("id");
        int roomIdx = Integer.parseInt(request.getParameter("roomIdx"));
        String messageContent = request.getParameter("message");

        // 메시지 저장
        ChatDTO chatMessage = new ChatDTO();
        chatMessage.setRoomIdx(roomIdx);
        chatMessage.setUserId(userId);
        chatMessage.setChatContent(messageContent);
        chatDAO.insertChatMessage(chatMessage);

        // 저장 후 해당 방의 메시지 목록으로 리다이렉트
        response.sendRedirect("chatController?roomIdx=" + roomIdx);
    }
}
