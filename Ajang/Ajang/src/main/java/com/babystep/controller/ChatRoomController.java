package com.babystep.controller;

import com.babystep.model.ChatRoomDTO;
import com.babystep.model.ChatRoomDAO;
import com.babystep.db.SqlSessionManager;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/createChatRoom.do")
public class ChatRoomController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 세션에서 id 가져오기 (세션에 "id"로 저장됨)
        String userId = (String) request.getSession().getAttribute("id");

        // id가 null인지 확인
        if (userId == null) {
            // id가 없을 경우, 에러 처리
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User ID is not available in session");
            return;
        }

        // 폼 데이터 가져오기
        String roomTitle = request.getParameter("roomTitle");
        int roomLimit;
        String roomImg = request.getParameter("roomImg");

        try {
            // roomLimit을 정수로 변환
            roomLimit = Integer.parseInt(request.getParameter("roomLimit"));
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid room limit");
            return;
        }

        // 채팅방 정보를 담은 DTO 객체 생성
        ChatRoomDTO chatRoomList = new ChatRoomDTO(roomTitle, roomLimit, roomImg, userId);

        // DAO를 통해 채팅방 생성
        try (SqlSession sqlSession = SqlSessionManager.getSession()) {
            ChatRoomDAO chatRoomDAO = new ChatRoomDAO(sqlSession);
            chatRoomDAO.insertChatRoom(chatRoomList);
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create chat room");
            return;
        }

        // 방 목록 페이지로 리다이렉트
        response.sendRedirect("chatRoomList.jsp");
    }
}
