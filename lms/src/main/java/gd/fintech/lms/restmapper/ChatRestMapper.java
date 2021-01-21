package gd.fintech.lms.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.ChatList;

@Mapper
public interface ChatRestMapper {
	// 사용자 검색
	List<Map<String, Object>> selectAccountList(String searchAccount);
	// 채팅 내용 추가
	int insertChatList(ChatList chatList);
}
