package com.babystep.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babystep.model.BoardLikeDAO;
import com.babystep.model.BoardLikeDTO;


@WebServlet("/BoardLikeService")
public class BoardLikeService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		int boIdx = Integer.parseInt(request.getParameter("num"));
		System.out.println("num의 값" + boIdx);
		String userId = (String) request.getSession().getAttribute("id");

		BoardLikeDAO dao = new BoardLikeDAO();
		if ("like".equals(action)) {
			// 좋아요 추가
			dao.addLikeBoard(new BoardLikeDTO(boIdx,userId));
		} else if ("unlike".equals(action)) {
			// 좋아요 취소
			dao.unaddLikeBoard(new BoardLikeDTO(boIdx,userId));
		}
		
		
}
}