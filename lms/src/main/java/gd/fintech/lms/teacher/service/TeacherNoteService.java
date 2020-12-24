package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherNoteMapper;
import gd.fintech.lms.vo.Note;

@Service
@Transactional
public class TeacherNoteService {
	@Autowired private TeacherNoteMapper teacherNoteMapper;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	// 쪽지 수신함
	public List<Note> selectNoteReceiveListByPage(String teacherId, int beginRow, int rowPerPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("teacherId", teacherId);		// 강사 ID
		map.put("beginRow", beginRow);			// 시작 데이터
		map.put("rowPerPage", rowPerPage);		// 한 페이지당 표시할 데이터 수
		
		List<Note> noteReceiveList = teacherNoteMapper.selectNoteReceiveListByPage(map);
		
		// [Logger] 쪽지 수신 목록(noteReceiveList)
		logger.trace("noteReceiveList[" + noteReceiveList + "]");
		
		return noteReceiveList;
	}
	
	// 쪽지 수신함 총 데이터 수
	public int selectTeacherNoteReceiveCount(String teacherId) {
		return teacherNoteMapper.selectTeacherNoteReceiveCount(teacherId);
	}
	
	// 쪽지 발신함
	public List<Note> selectNoteDispatchListByPage(String teacherId, int beginRow, int rowPerPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("teacherId", teacherId);		// 강사 ID
		map.put("beginRow", beginRow);			// 시작 데이터
		map.put("rowPerPage", rowPerPage);		// 한 페이지당 표시할 데이터 수
		
		List<Note> noteDispatchList = teacherNoteMapper.selectNoteDispatchListByPage(map);
		
		// [Logger] 쪽지 발신 목록(noteDispatchList)
		logger.trace("noteDispatchList[" + noteDispatchList + "]");
		
		return noteDispatchList;
	}
	
	// 쪽지 발신함 총 데이터 수
	public int selectTeacherNoteDispatchCount(String teacherId) {
		return teacherNoteMapper.selectTeacherNoteDispatchCount(teacherId);
	}

	// 쪽지 상세보기 - 수신함에서
	public Note selectNoteReceiveOne(int noteNo) {
		teacherNoteMapper.updateNoteIsRead(noteNo); 	// 읽음 상태로 변경
		return teacherNoteMapper.selectNoteOne(noteNo);
	}
	
	// 쪽지 상세보기 - 발신함에서
	public Note selectNoteDispatchOne(int noteNo) {
		return teacherNoteMapper.selectNoteOne(noteNo);
	}

	// 쪽지 보내기
	public int insertNote(Note note) {
		return teacherNoteMapper.insertNote(note);
	}
	
	// 쪽지 삭제하기
	public void deleteNote(Note note) {
		// 해당 쪽지의 삭제 상태 가져오기
		String noteDeleteState = teacherNoteMapper.selectNoteDelete(note);
		// 미삭제 상태라면
		if (noteDeleteState.equals("none")) {
			teacherNoteMapper.updateNoteDelete(note);
		// 한쪽에서 이미 삭제 상태라면
		} else {
			teacherNoteMapper.deleteNote(note);
		}
	}
	
}
