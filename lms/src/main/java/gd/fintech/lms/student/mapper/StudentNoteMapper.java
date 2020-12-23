package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Note;

@Mapper
public interface StudentNoteMapper {
	// 쪽지 수신 목록 가져오기
	public List<Note> selectNoteReceiveListByPage(Map<String, Object> map);
	
	// 쪽지 수신 개수
	public int selectNoteReceiveListCount(String accountId);
	
	// 쪽지 발신 목록 가져오기
	public List<Note> selectNoteDispatchListByPage(Map<String, Object> map);
	
	// 쪽지 수신 개수
	public int selectNoteDispatchListCount(String accountId);
	
	// 쪽지 상세보기
	public Note selectNoteOne(int noteNo);
	
	// 쪽지 읽음 상태로 변경
	public int updateNoteIsRead(int noteNo);
	
	// 쪽지 보내기
	public int insertNote(Note note);
	
}
