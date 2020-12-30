package gd.fintech.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.Teacher;

@Mapper
public interface ForgotMapper {
	
	// 학생 정보 찾기
	public Student selectStudent(Student student);
	
	// 강사 정보 찾기
	public Teacher selectTeacher(Teacher teacher);
	
	// 운영자 정보 찾기
	public Manager selectManager(Manager manager);
	
	// 계정 비밀번호 변경
	public int updateAccountPassword(Account account);
	
}
