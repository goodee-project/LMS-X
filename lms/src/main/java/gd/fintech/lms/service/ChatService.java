package gd.fintech.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.mapper.ChatMapper;
import gd.fintech.lms.vo.ChatroomList;

@Service 
public class ChatService {
	@Autowired ChatMapper chatMapper;
	// 채팅방 생성
	public int insertChatroomList(ChatroomList chatroomList) {
		return chatMapper.insertChatroomList(chatroomList);
	}
	// 채팅방 정보 가져오기
	public ChatroomList selectChatroomList(String chatroomUuid) {
		return chatMapper.selectChatroomList(chatroomUuid);
	}
}
