package com.babystep.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babystep.model.CommentDAO;
import com.babystep.model.CommentDTO;

public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파라미터로 넘어온 댓글 내용과 게시물 번호를 받음
        String commentContent = request.getParameter("commentContent");
        String userId = (String) request.getSession().getAttribute("id"); // 세션에서 사용자 ID 가져오기
        int boIdx = Integer.parseInt(request.getParameter("boIdx"));

        // 댓글 DTO 생성 및 데이터 설정
        CommentDTO commentDTO = new CommentDTO();
        commentDTO.setBoIdx(boIdx);
        commentDTO.setUserId(userId);
        commentDTO.setCommentContent(commentContent);

        // 댓글 DAO를 통해 데이터베이스에 저장
        CommentDAO commentDAO = new CommentDAO();
        commentDAO.insertComment(commentDTO);

        // 댓글이 저장된 후 다시 게시물 상세보기 페이지로 리다이렉트
        response.sendRedirect("BoardDetail.jsp?num=" + boIdx); 
        
	}

}
