package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Note;

@Mapper
public interface ManagerNoteMapper {
	// 쪽지 수신 목록 가져오기
	public List<Note> selecteNoteReceiveListByPage(Map<String, Object> map);
	
	// 쪽지 수신 개수
	// accountId에 해당하는 쪽지 수
	public int selectNoteReceiveListCount(String accountId);
	
	// 쪽지 발신 목록 가져오기
	public List<Note> selectNoteDispatchListByPage(Map<String, Object> map);
	
	// 쪽지 발진 개수
	// accountId에 해당하는 쪽지 수
	public int selectNoteDispatchListCount(String accountId);
}
