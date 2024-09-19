package com.babystep.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("id");

        if (!saveDir.exists()) {
            saveDir.mkdirs();
        }

        int maxSize = 1024 * 1024 * 10; // 10MB 제한
        String encoding = "UTF-8";
        DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

        // 이 부분에서 MultipartRequest 객체를 생성해야 함
        MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);

        // 이후 multi 객체를 사용하여 form 데이터 및 파일 처리
        String DI_TITLE = multi.getParameter("title");
        String dateString = multi.getParameter("date"); // 날짜 문자열을 먼저 받음
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date CREATED_AT = null;
        try {
            CREATED_AT = formatter.parse(dateString); // 문자열을 Date로 변환
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Integer DI_BABYNUMBER = Integer.parseInt(multi.getParameter("babynumber"));
        int DI_HEIGHT = Integer.parseInt(multi.getParameter("height"));
        int DI_WEIGHT = Integer.parseInt(multi.getParameter("weight"));
        String DI_CONTENT = multi.getParameter("content");
        String[] USED_IMG = new String[2];
        for (int i = 1; i <= 2; i++) {
            USED_IMG[i - 1] = multi.getFilesystemName("file" + i);
            if (USED_IMG[i - 1] == null) USED_IMG[i - 1] = ""; // 파일이 없을 경우 빈 문자열로 설정
        }

        // 이후 DB 저장 로직을 추가
    }
}
