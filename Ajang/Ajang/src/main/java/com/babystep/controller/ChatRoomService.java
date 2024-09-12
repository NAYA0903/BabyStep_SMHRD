package com.babystep.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.babystep.db.ChatRoomMapper;
import com.babystep.model.ChatRoomDTO;

@Service
public class ChatRoomService {

    @Autowired
    private ChatRoomMapper chatRoomMapper;

    public List<ChatRoomDTO> getAllRooms() {
        return chatRoomMapper.getAllRooms();
    }

    public ChatRoomDTO getRoomByTitle(String roomTitle) {
        return chatRoomMapper.getRoomByTitle(roomTitle);
    }

    public void createRoom(ChatRoomDTO room) {
        chatRoomMapper.createRoom(room);
    }

    public void updateRoom(ChatRoomDTO room) {
        chatRoomMapper.updateRoom(room);
    }

    public void deleteRoom(int roomIdx) {
        chatRoomMapper.deleteRoom(roomIdx);
    }
}
