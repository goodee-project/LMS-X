package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Note;

@Mapper
public interface TeacherNoteMapper {
	// 쪽지 수신함
	// 강사 ID(teacherId), 시작 데이터(beginRow), 한 페이지당 표시할 데이터 수(rowPerPage) 
	List<Note> selectNoteReceiveListByPage(Map<String, Object> map);
	
	// 쪽지 수신함 총 데이터 수
	// 강사 ID(teacherId)
	int selectTeacherNoteReceiveCount(Map<String, Object> map);
	
	// 쪽지 발신함
	// 강사 ID(teacherId), 시작 데이터(beginRow), 한 페이지당 표시할 데이터 수(rowPerPage) 
	List<Note> selectNoteDispatchListByPage(Map<String, Object> map);
	
	// 쪽지 발신함 총 데이터 수
	// 강사 ID(teacherId)
	int selectTeacherNoteDispatchCount(Map<String, Object> map);

	// 쪽지 상세보기
	public Note selectNoteOne(int noteNo);
	
	// 쪽지 읽음 상태로 변경
	int updateNoteIsRead(int noteNo);
	
	// 쪽지 보내기
	int insertNote(Note note);
	
	// 쪽지 삭제 상태 확인
	String selectNoteDelete(Note note);
	
	// 쪽지 나에게만 삭제
	int updateNoteDelete(Note note);
	
	// 양쪽 다 해당 쪽지 삭제시 : 완전 삭제
	int deleteNote(Note note);
}
