package gd.fintech.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.mapper.ForgotMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.Teacher;

@Service
@Transactional
public class ForgotService {
	@Autowired private ForgotMapper forgotMapper;
	
	
	// 학생 정보 찾기
	public Student GetStudent(String email, String name, String phone) {
		Student student = new Student();
		student.setStudentEmail(email);
		student.setStudentName(name);
		student.setStudentPhone(phone);
		
		return forgotMapper.selectStudent(student);
	}
	
	// 강사 정보 찾기
	public Teacher GetTeacher(String email, String name, String phone) {
		Teacher teacher = new Teacher();
		teacher.setTeacherEmail(email);
		teacher.setTeacherName(name);
		teacher.setTeacherPhone(phone);
		
		return forgotMapper.selectTeacher(teacher);
	}
	
	// 운영자 정보 찾기
	public Manager GetManager(String email, String name, String phone) {
		Manager manager = new Manager();
		manager.setManagerEmail(email);
		manager.setManagerName(name);
		manager.setManagerPhone(phone);
		
		return forgotMapper.selectManager(manager);
	}
	
	// 계정 비밀번호 변경
	public int updateAccountPassword(String accountId, String password) {
		Account account = new Account();
		account.setAccountId(accountId);
		account.setAccountPw(password);
		
		return forgotMapper.updateAccountPassword(account);
	}
}
