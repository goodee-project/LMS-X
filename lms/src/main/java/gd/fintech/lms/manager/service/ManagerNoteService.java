package gd.fintech.lms.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerNoteMapper;
import gd.fintech.lms.vo.Note;

@Service
@Transactional
public class ManagerNoteService {
	@Autowired ManagerNoteMapper managerNoteMapper;
	
	// 쪽지 수신 목록 가져오기
	public List<Note> selectNoteReceiveListByPage(Map<String, Object> map) {
		return managerNoteMapper.selecteNoteReceiveListByPage(map);
	}
	
	// 쪽지 수신 개수 가져오기
	public int selectNoteReceiveListCount(String accountId) {
		return managerNoteMapper.selectNoteReceiveListCount(accountId);
	}
	
	// 쪽지 발신 목록 가져오기
	public List<Note> selectNoteDispatcherListByPage(Map<String, Object> map) {
		return managerNoteMapper.selectNoteDispatchListByPage(map);
	}
	
	// 쪽지 발신 개수 가져오기
	public int selectNoteDispatchListCount(String accountId) {
		return managerNoteMapper.selectNoteDispatchListCount(accountId);
	}
	
	// 수신함 쪽지 상세보기 
	// 쪽지 고유 번호(noteNo) 사용
	public Note selectNoteReceiveOne(int noteNo) {
		managerNoteMapper.updateNoteIsRead(noteNo);
		return managerNoteMapper.selectNoteOne(noteNo);
	}
	
	// 발신함 쪽지 상세보기
	// 쪽지 고유 번호(noteNo) 사용
	public Note selectNoteDispatchOne(int noteNo) {
		managerNoteMapper.updateNoteIsRead(noteNo);
		return managerNoteMapper.selectNoteOne(noteNo);
	}
	
	// 쪽지 보내기
	// Note 객체에 데이터를 저장
	public int insertNote(Note note) {
		return managerNoteMapper.insertNote(note);
	}
	
	// 쪽지 삭제하기
	// Note  객체에 데이터를 삭제
	public void deleteNote(Note note) {
		// 해당 쪽지의 삭제 상태 가져오기
		String noteDeleteState = managerNoteMapper.selectNoteDelete(note);
		// 미삭제 상태일 경우
		if (noteDeleteState.equals("none")) {
			managerNoteMapper.updateNoteDelete(note);
		} else { // 한쪽에서 이미 삭제 상태일 경우 
			managerNoteMapper.deleteNote(note);
		}
	}
}
