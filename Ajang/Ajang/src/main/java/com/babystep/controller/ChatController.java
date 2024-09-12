package com.babystep.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ChatController {

    @Autowired
    private ChatService chatService;

    @GetMapping("/chat")
    public String chatRoom(@RequestParam(value = "ROOM_IDX") Integer roomIdx, Model model) {
        if (roomIdx == null || roomIdx <= 0) {
            // 유효하지 않은 roomIdx 처리
            return "error"; // 에러 페이지 또는 로직
        }
        model.addAttribute("ROOM_IDX", roomIdx);
        model.addAttribute("chats", chatService.getChatByRoom(roomIdx));
        return "chat";
    }
}
