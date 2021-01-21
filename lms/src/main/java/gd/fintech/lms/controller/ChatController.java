package gd.fintech.lms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.service.ChatService;
import gd.fintech.lms.vo.ChatList;
import gd.fintech.lms.vo.ChatroomList;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ChatController {
	@Autowired ChatService chatService;
    // private final ChatRoomRepository chatRoomRepository;
	
    // 채팅방 목록
    @GetMapping("/auth/chatroomList")
    public String rooms(Model model, ServletRequest request){
		HttpSession session = ((HttpServletRequest)request).getSession();		
		String accountId = (String)session.getAttribute("loginId");
    	List<ChatroomList> chatroomList = chatService.selectChatroomListAll(accountId);
        model.addAttribute("chatroomList",chatroomList);
        return "/auth/chatroomList";
    }

    // 채팅 내용
    @GetMapping("/auth/rooms/{id}")
    public String room(@PathVariable String id, Model model, ServletRequest request){
		HttpSession session = ((HttpServletRequest)request).getSession();		
		String accountId = (String)session.getAttribute("loginId");
		Map<String, Object> map = new HashMap<>();
		map.put("accountId", accountId);
		map.put("chatroomUuid", id);
        ChatroomList chatroomList = chatService.selectChatroomList(map);
        List<ChatList> chatList = chatService.selectChatHistory(id);
        List<ChatroomList> chatroomListAll = chatService.selectChatroomListAll(accountId);
        // model.addAttribute("room",room);
        model.addAttribute("chatroomList",chatroomList);
        model.addAttribute("chatList",chatList);
        model.addAttribute("chatroomListAll",chatroomListAll);
        return "/auth/room";
    }

    // 채팅방 생성
    @GetMapping("/auth/room/new/{chatroomPerson1Id}/{chatroomPerson1Name}/{chatroomPerson2Id}/{chatroomPerson2Name}")
    public String makeRoom(ChatroomList chatroomList){
    	// 이미 채팅방이 있을경우 해당 채팅방으로 이동
    	if(chatService.selectCheckChatroomList(chatroomList) != null) {
            return "redirect:/auth/rooms/" + chatService.selectCheckChatroomList(chatroomList);  		
    	}
    	chatroomList.setChatroomUuid(UUID.randomUUID().toString().replace("-", ""));
    	chatService.insertChatroomList(chatroomList);
        return "redirect:/auth/rooms/" + chatroomList.getChatroomUuid();
    }

}