package gd.fintech.lms.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.restservice.ChatRestService;
import gd.fintech.lms.vo.ChatList;

@RestController
public class ChatRestController {
	@Autowired ChatRestService chatRestService;
	
	// 채팅 내용 추가
	@PostMapping("/auth/chat/insertChatList")
	public void insertChatList(ChatList chatList) {
		chatRestService.insertChatList(chatList);
	}

}
