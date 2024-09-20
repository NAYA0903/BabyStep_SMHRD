package com.babystep.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babystep.frontcontroller.Command;

public class FrontController extends HttpServlet{

      private static final long serialVersionUID = 1L;


      protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         System.out.println("FrontController 도착");
         
         // 1. 요청확인.(~~~~~.do)를 알아야함. http://localhost:1521/maven_MessageSystem/join.do
         String requestURI = request.getRequestURI();
         
         System.out.println(requestURI);
         
         // contextPath만 빼버리기
         String contextPath = request.getContextPath();
         // maven_MessageSystem/join.do ->
         String result = requestURI.substring(contextPath.length());
         System.out.println("들어온 요청은?" + result);
         
         request.setCharacterEncoding("UTF-8"); 
         Command service = null ;
      }
}