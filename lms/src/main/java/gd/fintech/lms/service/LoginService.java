package gd.fintech.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.mapper.LoginMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.Teacher;

@Service
@Transactional
public class LoginService {
	@Autowired private LoginMapper loginMapper;
	
	// 로그인 체크 
	public Account getLoginCheck(Account account){
		Account loginCheck = loginMapper.selectLoginCheck(account);
		
		// loginCheck가 null이 아니면 loginCheck값을 리턴 
		if ( loginCheck != null ) {
			return loginCheck;
		}
		// loginCheck가 null이면 null 리턴
		return null;
	}
	
	// 학생 이름 찾기
	public Student getStudentName(String accountId) {
		
		return loginMapper.selectStudentName(accountId);
	}
	
	// 강사 이름 찾기
	public Teacher getTeacherName(String accountId) {
		
		return loginMapper.selectTeacherName(accountId);
	}
	
	// 운영자 이름 찾기
	public Manager getManagerName(String accountId) {
		
		return loginMapper.selectManagerName(accountId);
	}
}
