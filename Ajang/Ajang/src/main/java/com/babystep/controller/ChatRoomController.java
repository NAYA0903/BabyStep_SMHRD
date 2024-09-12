package com.babystep.controller ;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ChatRoomController {

    @Autowired
    private ChatRoomService chatRoomService;

    // 채팅방 목록 페이지를 반환합니다.
    @GetMapping("/rooms")
    public String showRooms(Model model) {
        model.addAttribute("rooms", chatRoomService.getAllRooms());
        return "chatRooms";
    }

    // 특정 채팅방에 입장하는 요청을 처리합니다.
    @GetMapping("/chatRoom")
    public String enterRoom(@RequestParam("ROOM_IDX") int roomIdx, Model model) {
        // 선택된 채팅방 정보를 전달할 수 있습니다. (선택 사항)
        model.addAttribute("ROOM_IDX", roomIdx);
        return "chatRoom";  // chatRoom.jsp를 반환
    }
}
