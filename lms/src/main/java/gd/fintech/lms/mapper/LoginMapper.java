package gd.fintech.lms.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Admin;
import gd.fintech.lms.vo.LoginLog;
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
	
	// 관리자 이름 찾기
	public Admin selectAdminName(String accountId);
	
	// 로그인시 로그 기록 생성
	public int insertLoginLog(LoginLog loginLog);
	
	// 로그인시 이미지 조회
	public String selectLoginImage(String accountId);
	
	// 안읽은 수신 쪽지 개수
	public int selectNoteReceiveCount(String accountId);
}
