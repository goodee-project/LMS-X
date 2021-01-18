package gd.fintech.lms;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import gd.fintech.lms.service.ChatService;
import gd.fintech.lms.vo.ChatMessage;
import gd.fintech.lms.vo.ChatRoom;
import gd.fintech.lms.vo.ChatroomList;
import gd.fintech.lms.vo.MessageType;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class WebSocketHandler extends TextWebSocketHandler {
	@Autowired ChatService chatService;
    private final ChatRoomRepository chatRoomRepository;
    private final ObjectMapper objectMapper;
    // private Set<WebSocketSession> sessions = new HashSet<>();

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        log.info("메세지 전송 = {} : {}",session,message.getPayload());
        String msg = message.getPayload();
        ChatMessage chatMessage = objectMapper.readValue(msg,ChatMessage.class);
        // ChatRoom chatRoom = chatRoomRepository.findRoomById(chatMessage.getChatRoomId());
        // chatRoom.handleMessage(session,chatMessage,objectMapper);
        /*
        if(chatMessage.getType() == MessageType.ENTER){
            sessions.add(session);
            chatMessage.setMessage(chatMessage.getWriter() + "님이 입장하셨습니다.");
        }
        else if(chatMessage.getType() == MessageType.LEAVE){
            sessions.remove(session);
            chatMessage.setMessage(chatMessage.getWriter() + "님임 퇴장하셨습니다.");
        }
        else{
            chatMessage.setMessage(chatMessage.getWriter() + " : " + chatMessage.getMessage());
        }
        
        TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(chatMessage.getMessage()));
		for(WebSocketSession sess : sessions){
			sess.sendMessage(textMessage);
		}
        
        */
        ChatroomList chatroomList = chatRoomRepository.findRoomById(chatMessage.getChatRoomId());
        chatroomList.handleMessage(session, chatMessage, objectMapper);
    }

}