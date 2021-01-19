package gd.fintech.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.mapper.ChatMapper;
import gd.fintech.lms.vo.ChatList;
import gd.fintech.lms.vo.ChatroomList;

@Service 
public class ChatService {
	@Autowired ChatMapper chatMapper;
	// 이미 있는 채팅방인지
	public String selectCheckChatroomList(ChatroomList chatroomList) {
		return chatMapper.selectCheckChatroomList(chatroomList);
	}
	// 채팅방 생성
	public int insertChatroomList(ChatroomList chatroomList) {
		return chatMapper.insertChatroomList(chatroomList);
	}
	// 채팅방 정보 가져오기
	public ChatroomList selectChatroomList(String chatroomUuid) {
		return chatMapper.selectChatroomList(chatroomUuid);
	}
	// 이전 채팅 내용 불러오기
	public List<ChatList> selectChatHistory(String chatroomUuid) {
		return chatMapper.selectChatHistory(chatroomUuid);
	}
	
}
