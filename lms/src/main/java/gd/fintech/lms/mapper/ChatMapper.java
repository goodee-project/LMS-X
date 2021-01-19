package gd.fintech.lms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ChatList;
import gd.fintech.lms.vo.ChatroomList;

@Mapper
public interface ChatMapper {
	// 이미 있는 채팅방인지
	String selectCheckChatroomList(ChatroomList chatroomList);
	
	// 이전 채팅 내용 불러오기
	List<ChatList> selectChatHistory(String chatroomUuid);
	
	// 새로운 채팅방 생성
	int insertChatroomList(ChatroomList chatroomList);
	
	// 채팅방 정보 가져오기
	ChatroomList selectChatroomList(String chatroomUuid);
}
