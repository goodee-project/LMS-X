package gd.fintech.lms.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.service.ChatService;
import gd.fintech.lms.vo.ChatList;
import gd.fintech.lms.vo.ChatRoomForm;
import gd.fintech.lms.vo.ChatroomList;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ChatController {
	@Autowired ChatService chatService;
    // private final ChatRoomRepository chatRoomRepository;
	/*
    // 채팅방 목록
    @GetMapping("/auth/chat")
    public String rooms(Model model){
        model.addAttribute("rooms",chatRoomRepository.findAllRoom());
        return "/auth/chatRooms";
    }*/

    // 채팅 내용
    @GetMapping("/auth/rooms/{id}")
    public String room(@PathVariable String id, Model model){
        // ChatRoom room = chatRoomRepository.findRoomById(id);
        ChatroomList chatroomList = chatService.selectChatroomList(id);
        List<ChatList> chatList = chatService.selectChatHistory(id);
        // model.addAttribute("room",room);
        model.addAttribute("chatroomList",chatroomList);
        model.addAttribute("chatList",chatList);
        return "/auth/room";
    }
    
    @GetMapping("/auth/new")
    public String make(Model model){
        ChatRoomForm form = new ChatRoomForm();
        model.addAttribute("form",form);
        return "/auth/newRoom";
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
    /*
    @PostMapping("/auth/room/new")
    public String makeRoom(ChatRoomForm form){
        chatRoomRepository.createChatRoom(form.getName());

        return "redirect:/auth/chat";
    }*/

}