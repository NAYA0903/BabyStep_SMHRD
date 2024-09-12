package com.babystep.db;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.babystep.model.ChatRoomDTO;

@Mapper
public interface ChatRoomMapper {
    List<ChatRoomDTO> getAllRooms();  // 모든 채팅방 조회
    ChatRoomDTO getRoomByTitle(@Param("ROOM_TITLE") String roomTitle);  // 방 ID로 채팅방 조회
    void createRoom(ChatRoomDTO room);  // 채팅방 생성
    void updateRoom(ChatRoomDTO room);  // 채팅방 수정
    void deleteRoom(@Param("ROOM_IDX") int roomIdx);  // 채팅방 삭제
}

