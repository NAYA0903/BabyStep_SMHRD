package com.babystep.controller;

import com.babystep.model.PlaceDAO;
import com.babystep.model.PlaceDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Date;

@WebServlet("/api/createPlace") // 이 서블릿의 URL 매핑
public class PlaceRegister extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PlaceDAO placeDAO = new PlaceDAO(); // PlaceDAO 인스턴스 생성

    // POST 요청을 처리하는 메소드
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 사용자 입력 값 받기
        String placeName = request.getParameter("placeName");
        String placeAddr = request.getParameter("placeAddr");
        String placeTel = request.getParameter("placeTel");
        String placeUrl = request.getParameter("placeUrl");
        String userId = request.getParameter("userId"); // 사용자의 ID
        Integer placeLikes = 0; // 기본값으로 좋아요 수를 0으로 설정

        // 현재 날짜를 등록 날짜로 설정
        Date createAt = new Date(System.currentTimeMillis());

        // PlaceDTO 객체 생성 및 값 설정
        PlaceDTO place = new PlaceDTO();
        place.setPlaceName(placeName);
        place.setPlaceAddr(placeAddr);
        place.setPlaceTel(placeTel);
        place.setPlaceUrl(placeUrl);
        place.setCreatecAt(createAt);
        place.setUserId(userId);
        place.setPlaceLikes(placeLikes);

        // 장소 등록 처리
        try {
            placeDAO.createPlace(place); // DAO를 통해 데이터베이스에 장소 등록
            response.setContentType("application/json");
            response.getWriter().write("{\"success\":true}"); // 성공 응답
        } catch (Exception e) {
            e.printStackTrace(); // 에러 로그 출력
            response.setContentType("application/json");
            response.getWriter().write("{\"success\":false, \"message\":\"등록 중 오류 발생\"}"); // 오류 응답
        }
        
        // 파일 업로드 처리
        Part filePart = request.getPart("placePhoto"); // "placePhoto"는 HTML에서 지정한 name
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // 파일 이름 가져오기
        InputStream fileContent = filePart.getInputStream();

        // 파일을 저장하거나 필요한 방식으로 처리하는 코드 추가

    }
}
