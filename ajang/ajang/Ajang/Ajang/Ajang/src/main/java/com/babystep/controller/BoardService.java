package com.babystep.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babystep.model.BoardDAO;
import com.babystep.model.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/BoardService")
public class BoardService extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private BoardDAO boardDAO = new BoardDAO();  // DAO 객체 초기화
    
    // GET 요청 처리 (게시물 조회 및 조회수 증가)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 게시물 번호 가져오기
        int boIdx = Integer.parseInt(request.getParameter("num"));

        // 조회수 증가 처리
        boardDAO.increaseBoardHit(boIdx);
        
        // 게시물 상세 페이지로 리다이렉트
        response.sendRedirect("BoardDetail.jsp?num=" + boIdx);
    }

    // POST 요청 처리 (게시물 작성)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 파일이 저장될 서버의 경로 설정 (웹 애플리케이션 내의 파일 디렉토리)
        String savePath = request.getServletContext().getRealPath("./file");
        File saveDir = new File(savePath);
        
        // 디렉터리가 존재하지 않으면 생성
        if (!saveDir.exists()) {
            saveDir.mkdirs();
        }

        // 파일 업로드 설정
        int maxSize = 1024 * 1024 * 10; // 10MB 제한
        String encoding = "UTF-8";
        DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
    
        // 파일 업로드 해주는 객체 -> MultipartRequest
        MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
        
        // 세션에서 사용자 ID 가져오기
        HttpSession session = request.getSession();
        String USER_ID = (String) session.getAttribute("id");

        // 폼 데이터에서 사용자가 입력한 제목, 작성자, 내용 가져오기
        String BO_TITLE = multi.getParameter("title");
        String BO_CONTENT = multi.getParameter("content");

        // 파일명 처리
        String[] FILENAMES = new String[4];
        for (int i = 1; i <= 4; i++) {
            FILENAMES[i-1] = multi.getFilesystemName("file" + i);
            if (FILENAMES[i-1] == null) FILENAMES[i-1] = ""; // 파일이 없을 경우 빈 문자열로 설정
        }

        // 게시판 DTO 객체 생성
        BoardDTO vo = new BoardDTO(BO_TITLE, BO_CONTENT, USER_ID, FILENAMES[0], FILENAMES[1], FILENAMES[2], FILENAMES[3]);

        // 게시물 작성 처리
        int cnt = boardDAO.writeBoard(vo);

        // 결과에 따라 성공 또는 실패 메시지 처리
        if (cnt > 0) {
            // 작성 성공 시 게시물 목록으로 리다이렉트
            response.sendRedirect("BoardMain.jsp");
        } else {
            // 실패 시 에러 페이지로 포워딩 (추후 에러 처리 추가 가능)
            response.sendRedirect("error.jsp");
        }
    }
}
