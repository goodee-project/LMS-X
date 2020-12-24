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
public class ManagerNoteSerivce {
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
	public int selectNoteDispatcherListCount(String accountId) {
		return managerNoteMapper.selectNoteDispatchListCount(accountId);
	}
}
