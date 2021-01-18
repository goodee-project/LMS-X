package gd.fintech.lms.restservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.restmapper.ChatRestMapper;
import gd.fintech.lms.vo.ChatList;

@Service
public class ChatRestService {
	@Autowired ChatRestMapper chatRestMapper;
	
	// 이전 채팅 내용 불러오기
	public List<ChatList> selectChatHistory(String chatroomUuid) {
		return chatRestMapper.selectChatHistory(chatroomUuid);
	}
	
	// 채팅 내용 추가
	public int insertChatList(ChatList chatList) {
		return chatRestMapper.insertChatList(chatList);
	}

}
