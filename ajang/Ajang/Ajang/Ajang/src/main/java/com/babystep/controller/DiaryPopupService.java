package com.babystep.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babystep.model.DiaryPopupDAO;
import com.babystep.model.DiaryPopupDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/DiaryPopupService")
public class DiaryPopupService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("DiaryPopupService 연결 완료");

		String savePath = request.getServletContext().getRealPath("./file");
		System.out.println("savePath : " + savePath); // 디버깅용 출력 (파일 저장 경로 확인)
		File saveDir = new File(savePath);

		if (!saveDir.exists()) {
			saveDir.mkdirs();
		}

		int maxSize = 1024 * 1024 * 10; // 10MB 제한
		String encoding = "UTF-8";
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

		// MultipartRequest 객체 생성
		MultipartRequest multi = null;

		try {
			multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
			HttpSession session = request.getSession();
			
			// 세션에서 사용자 ID 가져오기
			String USER_ID = (String) session.getAttribute("id");
			if (USER_ID == null || USER_ID.isEmpty()) {
				// 로그인된 사용자가 없을 경우 처리
				response.sendRedirect("Login.jsp");
				return;
			}

			// form 데이터 및 파일 처리
			String DI_TITLE = multi.getParameter("title");
			String DI_CONTENT = multi.getParameter("content");
			String[] DI_FILE = new String[2];

			for (int i = 1; i <= 2; i++) {
			    DI_FILE[i - 1] = multi.getFilesystemName("file" + i);
			    if (DI_FILE[i - 1] == null || DI_FILE[i - 1].isEmpty()) {
			        DI_FILE[i - 1] = ""; // 파일이 없을 경우 빈 문자열로 설정
			    }
			}
			// 날짜 처리
			String dateString = multi.getParameter("date");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date CREATED_AT = formatter.parse(dateString); // 문자열을 Date로 변환

			// 나머지 파라미터 처리
			Integer DI_BABYNUMBER = Integer.parseInt(multi.getParameter("babynumber"));
			int DI_HEIGHT = Integer.parseInt(multi.getParameter("height"));
			int DI_WEIGHT = Integer.parseInt(multi.getParameter("weight"));

			// DiaryPopupDTO 객체 생성
			DiaryPopupDTO vo = new DiaryPopupDTO(DI_TITLE, DI_CONTENT, DI_FILE[0], DI_FILE[1], CREATED_AT, USER_ID,
					DI_BABYNUMBER, DI_HEIGHT, DI_WEIGHT);
			System.out.println(vo.toString()); // DTO 객체 디버깅 출력

			// DAO를 통한 DB 삽입
			int cnt = new DiaryPopupDAO().insertdiary(vo);
			if (cnt > 0) {
				System.out.println("일기 작성 성공");
				response.sendRedirect("Main.jsp");
			} else {
				System.out.println("일기 작성 실패");
				response.sendRedirect("Error.jsp"); // 실패 시 에러 페이지로 리다이렉션
			}

		} catch (ParseException e) {
			e.printStackTrace();
			response.sendRedirect("Error.jsp"); // 에러 발생 시 에러 페이지로 리다이렉션
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("Error.jsp");
		} finally {
			// 멀티파트 요청 후 필요한 리소스를 정리
			if (multi != null) {
				// 필요한 정리 작업이 있으면 이곳에 작성
			}
		}
	}
}
