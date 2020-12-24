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
	
	// 상세보기
	// 쪽지 고유번호(noteNo) 사용
	public Note selectNoteOne(int noteNo);
	
	// 쪽지 읽음 상태로 변경
	// 쪽지 고유번호(noteNo) 사용
	public int updateNoteIsRead(int noteNo);
	
	// 쪽지 보내기
	// Note 객체에 새로운 데이터 저장한다.
	public int insertNote(Note note);
	
	// 쪽지 삭제 상태 확인
	// Note 객체에 있는 데이터를 확인
	public String selectNoteDelete(Note note);
	
	// 쪽지 나에게만 삭제
	// Note 객체 있는 데이터를 삭제한다
	public int updateNoteDelete(Note note);
	
	// 양쪽 다 해당 쪽지 삭제시 완전삭제
	public int deleteNote(Note note);
}
