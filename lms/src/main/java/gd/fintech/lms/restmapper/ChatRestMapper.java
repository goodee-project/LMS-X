package gd.fintech.lms.restmapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ChatList;

@Mapper
public interface ChatRestMapper {
	// 채팅 내용 추가
	int insertChatList(ChatList chatList);
}
