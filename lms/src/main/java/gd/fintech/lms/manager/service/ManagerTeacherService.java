package gd.fintech.lms.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerTeacherMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Teacher;
import gd.fintech.lms.vo.TeacherQueue;

@Service
@Transactional
public class ManagerTeacherService {
	@Autowired ManagerTeacherMapper managerTeacherMapper;
	
	// 강사 목록 페이징
	public List<Map<String, Object>> getTeacherListByPage(Map<String, Object> map) {
		return managerTeacherMapper.selectTeacherListByPage(map);
	}
	
	// 강사 목록 페이징 카운트
	public int getCountTeacher(int rowPerPage) {
		return managerTeacherMapper.selectTeacherCount();
	}
	
	// 강사 목록 상세보기
	public Teacher getTeacherOne(String teacherId) {
		return managerTeacherMapper.selectTeacherOne(teacherId);
	}
	
	// 강사 승인대기 목록
	public List<TeacherQueue> getTeacherQueueListByPage(Map<String, Object> map){
		return managerTeacherMapper.selectTeacherQueueListByPage(map);
	}
	
	// 강사 승인대기 페이징
	public int getCountTeacherQueue(int rowPerPage) {
		return managerTeacherMapper.selectTeacherQueueCount();
	}
	
	// 강사 승인 거절
	public void negativeTeacher(String accountId) {
		// 강사 승인대기 테이블 삭제
		managerTeacherMapper.deleteTeacherQueue(accountId);
		// 계정 테이블 삭제
		managerTeacherMapper.deleteAccount(accountId);
	}
	
	// 강사 승인
	public void accessTeacher(String accountId, String loginId) {
		Account account = new Account();
		account.setAccountState("활성화");
		account.setAccountId(accountId);
		// 계정 정보 찾기
		Teacher teacher = managerTeacherMapper.selectTeacherQueueOne(accountId);
		teacher.setManagerIdAccess(loginId);
		// teacher.setTeacherImage("default.jpg");
		// 계정 상태 업데이트
		managerTeacherMapper.updateAccountState(account);
		// 강사 테이블 추가
		managerTeacherMapper.insertTeacher(teacher);
		// 강사 승인대기 테이블 삭제
		managerTeacherMapper.deleteTeacherQueue(accountId);
	}
}
