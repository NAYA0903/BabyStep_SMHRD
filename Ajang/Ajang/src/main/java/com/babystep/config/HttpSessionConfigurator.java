package com.babystep.config;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

public class HttpSessionConfigurator extends ServerEndpointConfig.Configurator {
	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
	    HttpSession httpSession = (HttpSession) request.getHttpSession();
	    if (httpSession != null) {
	        sec.getUserProperties().put("httpSession", httpSession);
	    } else {
	        System.out.println("HttpSession is null - Handshake failed to capture the session.");
	    }
	}
}
