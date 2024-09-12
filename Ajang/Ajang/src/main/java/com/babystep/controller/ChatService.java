package com.babystep.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.babystep.model.ChatDAO;
import com.babystep.model.ChatDTO;

@Service
public class ChatService {

    @Autowired
    private ChatDAO chatDAO;

    public void saveChat(ChatDTO chat) {
        chatDAO.insertChat(chat);
    }

    public List<ChatDTO> getChatByRoom(int roomIdx) {
        return chatDAO.selectChatByRoom(roomIdx);
    }
}
