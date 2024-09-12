package com.babystep.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ChatDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "com.babystep.db.ChatMapper";

    public void insertChat(ChatDTO chat) {
        sqlSession.insert(NAMESPACE + ".insertChat", chat);
    }

    public List<ChatDTO> selectChatByRoom(int roomIdx) {
        return sqlSession.selectList(NAMESPACE + ".selectChatByRoom", roomIdx);
    }
}