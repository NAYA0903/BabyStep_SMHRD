package com.babystep.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	
	// 추상메서드로써 기능과 값은 없지만 기본적으로 반드시 구현해야하는 것을 정의함.
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

}
