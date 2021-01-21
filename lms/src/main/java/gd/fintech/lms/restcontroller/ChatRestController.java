package gd.fintech.lms.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.restservice.ChatRestService;
import gd.fintech.lms.vo.ChatList;

@RestController
public class ChatRestController {
	@Autowired ChatRestService chatRestService;

	// 사용자 검색
	@GetMapping("/auth/chat/insertChatList/{searchAccount}")
	public List<Map<String, Object>> selectAccountList(@PathVariable(name="searchAccount") String searchAccount) {
		return chatRestService.selectAccountList(searchAccount);
	}
	// 채팅 내용 추가
	@PostMapping("/auth/chat/insertChatList")
	public void insertChatList(ChatList chatList) {
		chatRestService.insertChatList(chatList);
	}

}
