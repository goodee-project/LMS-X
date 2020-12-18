package gd.fintech.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.Teacher;

@Mapper
public interface LoginMapper {
	// 로그인 아이디 있는지 체크 
	public Account selectLoginCheck(Account account);
	
	// 학생 이름 찾기
	public Student selectStudentName(String accountId);
	
	// 강사 이름 찾기
	public Teacher selectTeacherName(String accountId);
	
	// 운영자 이름 찾기
	public Manager selectManagerName(String accountId);
}
