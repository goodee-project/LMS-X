package gd.fintech.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.ManagerQueue;
import gd.fintech.lms.vo.StudentQueue;
import gd.fintech.lms.vo.TeacherQueue;

@Mapper
public interface SignupMapper {
	//계정 추가
	public int insertAccount(Account account);
	//학생 대기 추가
	public int insertStudentQueue(StudentQueue studentQueue);
	
	//강사 대기 추가
	public int insertTeacherQueue(TeacherQueue teacherQueue);
	
	//운영자 대기 추가
	public int insertManagerQueue(ManagerQueue managerQueue);
}
