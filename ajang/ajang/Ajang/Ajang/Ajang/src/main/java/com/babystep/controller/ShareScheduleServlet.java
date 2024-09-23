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
		    String shareId = request.getParameter("shareId");  // 공유할 ID
		    String userId = (String) request.getSession().getAttribute("id");  // 현재 사용자 ID

		    // 사용자 입력 값 수집
		    String scheTitle = request.getParameter("scheTitle");
		    String scheContent = request.getParameter("scheContent");
		    String scheStDtStr = request.getParameter("scheStDt");
		    String scheEdDtStr = request.getParameter("scheEdDt");

		    // 날짜 형식 확인 및 처리
		    Date scheStDt = null;
		    Date scheEdDt = null;
		    try {
		        if (scheStDtStr != null && !scheStDtStr.isEmpty()) {
		            scheStDt = Date.valueOf(scheStDtStr);  // 시작일
		        }
		        if (scheEdDtStr != null && !scheEdDtStr.isEmpty()) {
		            scheEdDt = Date.valueOf(scheEdDtStr);  // 종료일
		        }
		    } catch (IllegalArgumentException e) {
		        response.getWriter().write("잘못된 날짜 형식입니다.");
		        return;  // 잘못된 형식일 경우 처리 중단
		    }

		    // 일정 객체 생성
		    ScheduleDTO newSchedule = new ScheduleDTO();
		    newSchedule.setScheTitle(scheTitle);
		    newSchedule.setScheContent(scheContent);
		    newSchedule.setScheStDt(scheStDt);
		    newSchedule.setScheEdDt(scheEdDt);
		    newSchedule.setUserId(userId);

		    // 일정 등록
		    ScheduleDAO scheduleDAO = new ScheduleDAO(SqlSessionManager.getSqlSession());
		    int scheIdx = scheduleDAO.addSchedule(newSchedule);  // 등록 후 SCHE_IDX 반환

		    // 공유 정보 등록
		    ShareDTO share = new ShareDTO();
		    share.setScheIdx(scheIdx);
		    share.setShareId(shareId);
		    share.setUserId(userId);

		    ShareDAO shareDAO = new ShareDAO(SqlSessionManager.getSqlSession());
		    shareDAO.addShare(share);

		    response.sendRedirect("MypagePopup.jsp");  // 등록 완료 후 리다이렉트
		}
	
}

