package gd.fintech.lms.restservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.restmapper.ChatRestMapper;
import gd.fintech.lms.vo.ChatList;

@Service
public class ChatRestService {
	@Autowired ChatRestMapper chatRestMapper;
	
	// 사용자 검색
	public List<Map<String, Object>> selectAccountList(String searchAccount) {
		return chatRestMapper.selectAccountList(searchAccount);
	}
	
	// 채팅 내용 추가
	public int insertChatList(ChatList chatList) {
		return chatRestMapper.insertChatList(chatList);
	}

}
