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
	int selectTeacherNoteReceiveCount(String teacherId);
	
	// 쪽지 발신함
	// 강사 ID(teacherId), 시작 데이터(beginRow), 한 페이지당 표시할 데이터 수(rowPerPage) 
	List<Note> selectNoteDispatchListByPage(Map<String, Object> map);
	
	// 쪽지 발신함 총 데이터 수
	// 강사 ID(teacherId)
	int selectTeacherNoteDispatchCount(String teacherId);
}
