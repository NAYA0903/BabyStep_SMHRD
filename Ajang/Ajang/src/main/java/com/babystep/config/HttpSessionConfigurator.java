package com.babystep.config;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.servlet.http.HttpServletRequest;

public class HttpSessionConfigurator extends ServerEndpointConfig.Configurator {
    @Override
    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
        HttpSession httpSession = (HttpSession) request.getHttpSession(); // 세션이 없으면 생성하지 않음
        if (httpSession == null) {
            System.out.println("HttpSession is null - Creating new session.");
            // HttpServletRequest를 사용하여 새로운 세션 생성
            if (request instanceof HttpServletRequest) {
                httpSession = ((HttpServletRequest) request).getSession(true);  // 새로운 세션 생성
                System.out.println("New HttpSession created with ID: " + httpSession.getId());
            }
        } else {
            System.out.println("Session ID: " + httpSession.getId());
        }

        // HttpSession을 WebSocket UserProperties에 저장
        if (httpSession != null) {
            sec.getUserProperties().put("httpSession", httpSession);
        } else {
            System.out.println("HttpSession is still null after attempt to create.");
        }
    }
}
