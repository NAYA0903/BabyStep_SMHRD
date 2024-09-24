package com.babystep.controller;

import com.babystep.model.DiaryPopupDAO;
import com.babystep.model.DiaryPopupDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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

@WebServlet({"/DiaryPopupService"})
public class DiaryPopupService extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public DiaryPopupService() {
   }

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("DiaryPopupService \uc5f0\uacb0 \uc644\ub8cc");
      String savePath = request.getServletContext().getRealPath("./file");
      System.out.println("savePath : " + savePath);
      File saveDir = new File(savePath);
      if (!saveDir.exists()) {
         saveDir.mkdirs();
      }

      int maxSize = 10485760;
      String encoding = "UTF-8";
      DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
      MultipartRequest multi = null;

      try {
         try {
            multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
            HttpSession session = request.getSession();
            String USER_ID = (String)session.getAttribute("id");
            if (USER_ID == null || USER_ID.isEmpty()) {
               response.sendRedirect("Login.jsp");
               return;
            }

            String DI_TITLE = multi.getParameter("title");
            String DI_CONTENT = multi.getParameter("content");
            System.out.println("content " + DI_CONTENT);
            String[] DI_FILE = new String[2];

         
            for (int i = 1; i <= 2; ++i) {
            	DI_FILE[i-1] = multi.getFilesystemName("file" + i);
                if (DI_FILE[i-1] == null) DI_FILE[i-1] = ""; // 파일이 없을 경우 빈 문자열로 설정
            }

            String dateString = multi.getParameter("date");
          
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date CREATED_AT = formatter.parse(dateString);
            
            int DI_HEIGHT = Integer.parseInt(multi.getParameter("height"));
            int DI_WEIGHT = Integer.parseInt(multi.getParameter("weight"));
            DiaryPopupDTO vo = new DiaryPopupDTO(DI_TITLE, DI_CONTENT, DI_FILE[0], DI_FILE[1], CREATED_AT, USER_ID,  DI_HEIGHT, DI_WEIGHT);
            System.out.println(vo.toString());
            int cnt = (new DiaryPopupDAO()).insertdiary(vo);
            if (cnt > 0) {
               
               response.sendRedirect("Main.jsp");
            } else {
              
               response.sendRedirect("Error.jsp");
            }
         } catch (ParseException var26) {
            var26.printStackTrace();
            response.sendRedirect("Error.jsp");
         } catch (Exception var27) {
            var27.printStackTrace();
            response.sendRedirect("Error.jsp");
         }

      } finally {
         ;
      }
   }
}
