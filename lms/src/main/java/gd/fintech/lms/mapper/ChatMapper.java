package gd.fintech.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ChatroomList;

@Mapper
public interface ChatMapper {
	// 새로운 채팅방 생성
	int insertChatroomList(ChatroomList chatroomList);
	
	// 채팅방 정보 가져오기
	ChatroomList selectChatroomList(String chatroomUuid);
}
