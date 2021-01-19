package gd.fintech.lms;
/*
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import gd.fintech.lms.vo.ChatroomList;

@Repository
public class ChatRoomRepository {
    private Map<String, ChatroomList> chatRoomMap;

    @PostConstruct
    private void init(){
        chatRoomMap = new LinkedHashMap<>();
    }
    
    public List<ChatroomList> findAllRoom(){
        List<ChatroomList> chatRooms = new ArrayList<>(chatRoomMap.values());
        Collections.reverse(chatRooms);
        return chatRooms;
    }
    
    public ChatroomList findRoomById(String id){
        return chatRoomMap.get(id);
    }

    public void createChatRoom(ChatroomList chatroomList){
        chatRoomMap.put(chatroomList.getChatroomUuid(), chatroomList);
    }
}*/