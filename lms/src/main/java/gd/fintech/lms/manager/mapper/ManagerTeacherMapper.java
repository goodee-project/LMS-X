package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Teacher;
import gd.fintech.lms.vo.TeacherQueue;

@Mapper
public interface ManagerTeacherMapper {
	// 강사 리스트
	public List<Map<String, Object>> selectTeacherListByPage(Map<String, Object> map);
	
	// 강사 페이징 카운트
	int selectTeacherCount();		
	
	// 강사 정보
	Teacher selectTeacherOne(String teacherId);	
	
	// 강사 승인 대기 목록
	public List<TeacherQueue> selectTeacherQueueListByPage(Map<String, Object> map);
	
	// 강사 승인 대기 페이징 카운트
	public int selectTeacherQueueCount();
	
	// 강사 승인 거절
	public int deleteTeacherQueue(String teacherId);
	public int deleteAccount(String accountId);
	
	// 강사 승인과 상태 업데이트
	public int updateAccountState(Account account);
	
	// 강사 승인대기 상세
	public Teacher selectTeacherQueueOne(String accountId);
	
	// 강사 테이블 추가
	public int insertTeacher(Teacher teacher);
}
