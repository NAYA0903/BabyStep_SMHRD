package com.babystep.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babystep.db.SqlSessionManager;
import com.babystep.model.ScheduleDAO;
import com.babystep.model.ScheduleDTO;
import com.babystep.model.ShareDAO;
import com.babystep.model.ShareDTO;

public class ShareScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   
		// 요청(Request) 인코딩 설정
        request.setCharacterEncoding("UTF-8");

        // 응답(Response) 인코딩 설정
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
		
		// 일정 데이터를 수집 및 설정
		ScheduleDTO newSchedule = new ScheduleDTO();
		newSchedule.setScheTitle(request.getParameter("scheTitle"));
		newSchedule.setScheContent(request.getParameter("scheContent"));
		
		// 날짜 변환 및 오류 처리
		try {
			String startDate = request.getParameter("scheStDt");
			String endDate = request.getParameter("scheEdDt");
			if (startDate != null && endDate != null) {
				newSchedule.setScheStDt(Date.valueOf(startDate));
				newSchedule.setScheEdDt(Date.valueOf(endDate));
			} else {
				// 날짜 값이 없을 경우 처리
				response.getWriter().println("날짜 입력이 잘못되었습니다.");
				return;
			}
		} catch (IllegalArgumentException e) {
			// 잘못된 날짜 형식에 대한 오류 처리
			e.printStackTrace();
			response.getWriter().println("잘못된 날짜 형식입니다.");
			return;
		}

		newSchedule.setUserId((String) request.getSession().getAttribute("userId"));

		ScheduleDAO scheduleDAO = new ScheduleDAO(SqlSessionManager.getSqlSession());

		// 일정 추가 후 SCHE_IDX 획득
		int scheIdx = scheduleDAO.addSchedule(newSchedule);

		// 일정이 성공적으로 추가되었으면 공유 데이터 등록
		if (scheIdx > 0) {
			ShareDTO share = new ShareDTO();
			share.setScheIdx(scheIdx);
			share.setShareId(request.getParameter("shareId"));
			share.setUserId((String) request.getSession().getAttribute("userId"));

			// 공유 데이터 등록
			ShareDAO shareDAO = new ShareDAO(SqlSessionManager.getSqlSession());
			shareDAO.addShare(share);
		}

		// 적절한 페이지로 리다이렉트 혹은 응답
		response.sendRedirect("Main.jsp");
	}
}
