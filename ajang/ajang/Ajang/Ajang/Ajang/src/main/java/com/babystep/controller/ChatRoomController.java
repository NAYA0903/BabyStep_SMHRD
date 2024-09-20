package com.babystep.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.babystep.db.SqlSessionManager;
import com.babystep.model.ChatRoomDAO;
import com.babystep.model.ChatRoomDTO;

@WebServlet("/createChatRoom.do")
public class ChatRoomController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	// 응답 인코딩 설정
    	response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
         
        // 세션에서 id 가져오기 (세션에 "id"로 저장됨)
        String userId = (String) request.getSession().getAttribute("id");

        // id가 null인지 확인
        if (userId == null) {
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
        ChatRoomDTO newChatRoom = new ChatRoomDTO(roomTitle, roomLimit, roomImg, userId);

        // DAO를 통해 채팅방 생성
        try (SqlSession sqlSession = SqlSessionManager.getSession()) {
            ChatRoomDAO chatRoomDAO = new ChatRoomDAO(sqlSession);
            chatRoomDAO.insertChatRoom(newChatRoom);
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create chat room");
            return;
        }

        // 방 목록 불러오기
        try (SqlSession sqlSession = SqlSessionManager.getSession()) {
            ChatRoomDAO chatRoomDAO = new ChatRoomDAO(sqlSession);
            List<ChatRoomDTO> chatRoomList = chatRoomDAO.selectAllChatRooms();
            System.out.println(chatRoomList);

            // JSP로 방 목록 전달
            request.setAttribute("chatRoomList", chatRoomList);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load chat rooms");
            return;
        }

        // 방 목록 페이지로 포워딩
        request.getRequestDispatcher("chatRoomList.jsp").forward(request, response);
    }
}

