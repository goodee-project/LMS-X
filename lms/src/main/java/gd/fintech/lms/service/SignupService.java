package gd.fintech.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.mapper.SignupMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.ManagerQueue;
import gd.fintech.lms.vo.StudentQueue;
import gd.fintech.lms.vo.TeacherQueue;

@Service
@Transactional
public class SignupService {
	@Autowired private SignupMapper signupMapper;
	
	// 학생 회원가입
	public void insertStudentAccount(Account account, StudentQueue studentQueue) {
		
		signupMapper.insertAccount(account); 			// 계정테이블 추가
		signupMapper.insertStudentQueue(studentQueue); 	// 학생 대기테이블 추가
	}
	
	// 강사 회원가입
	public void insertTeacherAccount(Account account, TeacherQueue teacherQueue) {
		
		signupMapper.insertAccount(account); 			// 계정 테이블 추가
		signupMapper.insertTeacherQueue(teacherQueue); 	// 강사 대기테이블 추가
	}
	
	// 운영자 회원가입
	public void insertManagerAccount(Account account, ManagerQueue managerQueue) {
		
		signupMapper.insertAccount(account);			// 계정 테이블 추가
		signupMapper.insertManagerQueue(managerQueue); 	// 운영자 대기테이블 추가
	}
}
