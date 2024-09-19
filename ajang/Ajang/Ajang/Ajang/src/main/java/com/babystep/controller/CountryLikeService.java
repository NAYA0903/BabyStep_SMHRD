package com.babystep.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babystep.model.CountryLikeDAO;
import com.babystep.model.CountryLikeDTO;

@WebServlet("/CountryLikeService")
public class CountryLikeService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String userId = (String) request.getSession().getAttribute("id");
		int usedIdx = Integer.parseInt(request.getParameter("num"));

		CountryLikeDAO dao = new CountryLikeDAO();
		if ("like".equals(action)) {
			// 좋아요 추가
			dao.addLikeCountry(new CountryLikeDTO(userId, usedIdx));
		} else if ("unlike".equals(action)) {
			// 좋아요 취소
			dao.unaddLikeCountry(new CountryLikeDTO(userId, usedIdx));
		}
	}
}
