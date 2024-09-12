package com.babystep.controller ;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.babystep.model.ChatRoomDTO;

@Controller
public class ChatRoomController {

    @Autowired
    private ChatRoomService chatRoomService;

    // 채팅방 목록 페이지를 반환합니다.
    @GetMapping("/rooms")
    public String showRooms(Model model) {
    	List<ChatRoomDTO> rooms = chatRoomService.getAllRooms();
        model.addAttribute("rooms", rooms);  // 모델에 rooms 리스트 추가
        return "chatRooms";
    }

    @GetMapping("/chatRoom")
    public String enterRoom(@RequestParam("ROOM_TITLE") String roomTitle, Model model) {
        ChatRoomDTO chatRoom = chatRoomService.getRoomByTitle(roomTitle);
        model.addAttribute("chatRoom", chatRoom);  // chatRoom 객체를 모델에 추가
        return "chatRoom";  // chatRoom.jsp로 이동
    }
    
    @GetMapping("/getRoomByTitle")
    public String getRoomByTitle(@RequestParam("ROOM_TITLE") String roomTitle, Model model) {
        ChatRoomDTO chatRoom = chatRoomService.getRoomByTitle(roomTitle);
        
        if (chatRoom == null) {
            return "errorPage"; // 방이 없을 경우 오류 페이지로 리다이렉트
        }

        model.addAttribute("chatRoom", chatRoom);
        return "chatRoom"; // chatRoom.jsp로 이동
    }
}
