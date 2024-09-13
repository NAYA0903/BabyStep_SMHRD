package com.babystep.controller;

import java.io.IOException;

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
	        String roomTitle = request.getParameter("roomTitle");
	        int roomLimit = Integer.parseInt(request.getParameter("roomLimit"));
	        String roomImg = request.getParameter("roomImg");
	        String userId = (String) request.getSession().getAttribute("userId");

	        // 방 정보를 담은 DTO 객체 생성
	        ChatRoomDTO chatRoom = new ChatRoomDTO(roomTitle, roomLimit, roomImg, userId);
	        chatRoom.setRoomTitle(roomTitle);
	        chatRoom.setRoomLimit(roomLimit);
	        chatRoom.setRoomImg(roomImg);
	        chatRoom.setUserId(userId);

	        // DAO를 통해 방 생성
	        SqlSession sqlSession = SqlSessionManager.getSession();
	        ChatRoomDAO chatRoomDAO = new ChatRoomDAO(sqlSession);
	        chatRoomDAO.insertChatRoom(chatRoom);
	        sqlSession.commit();
	        sqlSession.close();

	        // 방 목록 페이지로 리다이렉트
	        response.sendRedirect("chatRoomList.jsp");
	    }
	}
	


