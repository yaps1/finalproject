package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ChatMessageVO;
import com.example.demo.vo.ChatRoomVO;

@Repository
public class ChatDAO {
	public List<ChatRoomVO> listChatRoomByMember(int member_no){
		return DBManager.listChatRoomByMember(member_no);
	}
	
	public int insertChatMessage(ChatMessageVO c) {
		return DBManager.insertChatMessage(c);
	}
	
	public int insertChatImage(ChatMessageVO c) {
		return DBManager.insertChatImage(c);
	}
	
	public List<ChatMessageVO> listChatMessage(int room_no){
		return DBManager.listChatMessage(room_no);
	}
}
