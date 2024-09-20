package com.babystep.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordUtil {
	
	public static String hashPassword(String pw) throws NoSuchAlgorithmException {
	        
		 // SHA-256 해시 알고리즘 사용
	        MessageDigest md = MessageDigest.getInstance("SHA-256");
	        md.update(pw.getBytes());
	        byte[] byteData = md.digest();

	        // 해싱된 데이터를 16진수 문자열로 변환
	        StringBuilder sb = new StringBuilder();
	        for (byte b : byteData) {
	            sb.append(String.format("%02x", b));
	        }
	        return sb.toString();
	    }
	}
