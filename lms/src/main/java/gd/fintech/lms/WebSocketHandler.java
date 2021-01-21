package gd.fintech.lms;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import gd.fintech.lms.service.ChatService;
import gd.fintech.lms.vo.ChatMessage;
import gd.fintech.lms.vo.MessageType;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class WebSocketHandler extends TextWebSocketHandler {
	@Autowired ChatService chatService;
    // private final ChatRoomRepository chatRoomRepository;
    private final ObjectMapper objectMapper;
    private List<WebSocketSession> sessionList = new ArrayList<>();
    private Map<String, List<WebSocketSession>> sessions = new HashMap<>();
	
	// 메세지 보낼때
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        log.info("메세지 전송 = {} : {}",session,message.getPayload());
        String msg = message.getPayload();
        ChatMessage chatMessage = objectMapper.readValue(msg,ChatMessage.class);
        // ChatRoom chatRoom = chatRoomRepository.findRoomById(chatMessage.getChatRoomId());
        // chatRoom.handleMessage(session,chatMessage,objectMapper);
        
        // 새로운 세션(사용자)가 들어 왔을 시
        if(chatMessage.getType() == MessageType.ENTER){
        	
        	// 해당 채팅방에 세션이 하나 이상 존재시
        	if(sessions.get(chatMessage.getChatRoomId()) != null) {
        		sessionList = sessions.get(chatMessage.getChatRoomId()); // 해당 채팅방의 세션들을 가져옴
            // 해당 채팅방에 세션이 존재하지 않으면서 세션 리스트가 비어있지 않을시 
        	} else if(sessions.get(chatMessage.getChatRoomId()) == null && !sessionList.isEmpty()) {
        		sessionList = new ArrayList<>(); // 세션 리스트를 초기화함
            }
        	sessionList.add(session); // 새로운 세션을 리스트에 추가함

        	sessions.put(chatMessage.getChatRoomId(), sessionList); // 새로운 세션을 해당 채팅방에 추가시켜줌
            // chatMessage.setMessage(chatMessage.getWriter() + "님이 입장하셨습니다.");
        }
        // 세션(사용자)이 떠날 때
        else if(chatMessage.getType() == MessageType.LEAVE){
        	sessionList = sessions.get(chatMessage.getChatRoomId()); // 해당 채팅방의 세션들을 가져옴
        	sessionList.remove(session); // 해당 세션을 리스트에서 제거함
        	sessions.remove(chatMessage.getChatRoomId());
        	sessions.put(chatMessage.getChatRoomId(), sessionList); // 제거한 사항을 적용함
            // chatMessage.setMessage(chatMessage.getWriter() + "님임 퇴장하셨습니다.");
        }
        // 채팅시
        else{
    		// 현재 날짜
    		/*
    		Calendar currentDay = Calendar.getInstance();
        	chatMessage.setChatDate(currentDay.toString());
        	*/
    		Date today = new Date();
        	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        	chatMessage.setChatDate(format1.format(today));
        	// 메세지 내용
            chatMessage.setMessage(chatMessage.getWriterId() + "," + chatMessage.getWriterName() + "," + chatMessage.getChatDate() + "," + chatMessage.getMessage());
            // 새로운 메세지를 해당 채팅방에만 뿌림
            TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(chatMessage.getMessage()));
    		for(WebSocketSession sess : sessions.get(chatMessage.getChatRoomId())){
    			sess.sendMessage(textMessage);
    		}
        }
        
        /*
        ChatroomList chatroomList = new ChatroomList();
        chatroomList = chatService.selectChatroomList(chatMessage.getChatRoomId());
        System.out.println(chatroomList.getSessions() + " : handleTextMessage chatroomList");
        System.out.println(chatroomList.getSessions() + " : handleTextMessage session");
        chatroomList.handleMessage(session, chatMessage, objectMapper);*/
    }

}