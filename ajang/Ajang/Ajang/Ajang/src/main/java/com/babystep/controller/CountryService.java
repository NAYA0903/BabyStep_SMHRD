package com.babystep.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babystep.model.CountryDAO;
import com.babystep.model.CountryDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



@WebServlet("/CountryService")
public class CountryService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 파일이 저장되 서버의 경로를 설정 (웹 애플리케이션 내의 파일 디렉토리)

		System.out.println("CountryService 연결 완료");
		String savePath = request.getServletContext().getRealPath("./file");
		System.out.println("savePath : " + savePath); // 디버깅용 출력 (파일 저장 경로 확인)
		// 파일이 저장될 서버의 경로를 설정 (웹 애플리케이션 내의 파일 디렉토리)
		File saveDir = new File(savePath);

		// 디렉터리가 존재하지 않으면 생성
		if (!saveDir.exists()) {
			saveDir.mkdirs();
		}
		
		// 파일 업로드의 최대 크기 설정 (10MB 제한)
		int maxSize = 1024 * 1024 * 10 ; //10MB 제한
		 // 인코딩 방식 설정 (UTF-8로 한글 처리 지원)
        String encoding = "UTF-8";
        // 동일한 파일명이 있을 경우 자동으로 파일명을 바꿔주는 정책 설정
        DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
    
        MultipartRequest multi;
        try {
			
            // MultipartRequest 객체 생성 (실제 파일 업로드 처리 수행)
        	HttpSession session = request.getSession();
            multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
            // 폼 데이터에서 사용자가 입력한 제목, 작성자, 내용 가져오기
            String USED_TITLE = multi.getParameter("title"); // 중고나라 제목
            System.out.println(USED_TITLE);
            Integer USED_PRICE = Integer.parseInt(multi.getParameter("price")); // 중고나라 가격
            System.out.println(USED_PRICE);
            String USED_CONTENT = multi.getParameter("content"); // 중고나라 내용
            System.out.println(USED_CONTENT);
            String USER_ID = (String) session.getAttribute("id");
            System.out.println(USER_ID);
            String[] USED_IMG = new String[4];
            for (int i = 1; i <= 4; i++) {
            	USED_IMG[i-1] = multi.getFilesystemName("file" + i);
                if (USED_IMG[i-1] == null) USED_IMG[i-1] = ""; // 파일이 없을 경우 빈 문자열로 설정
           
            }
            
            CountryDTO vo = new CountryDTO(USED_TITLE, USED_PRICE, USED_CONTENT, USED_IMG[0] ,  USED_IMG[1],  USED_IMG[2],  USED_IMG[3], USER_ID) ;
            System.out.println(vo.toString()); // DTO 객체 디버깅 출력
            
            // CountryDAO를 통해 데이터베이스에 게시글 정보를 저장 (파일 포함)
            int cnt = new CountryDAO().writeCountry(vo);
      
            System.out.println("정보 저장 도달");
            // 결과에 따라	 성공 또는 실패 메시지 출력
        	if (cnt > 0) {
				System.out.println("게시글 작성 성공");
			} else {
				System.out.println("게시글 작성 실패");
			}
                // 성공 시 BoardMain.jsp로 리다이렉트
                response.sendRedirect("CountryMain.jsp");
            
            
        } catch (Exception e) {
        	// TODO: handle exception
        } {

        }
        }

}
