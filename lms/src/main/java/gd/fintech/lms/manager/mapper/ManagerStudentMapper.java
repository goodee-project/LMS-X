package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.MypageImage;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.StudentQueue;

@Mapper
public interface ManagerStudentMapper {
	// 학생 리스트
	public List<Student> selectStudentListByPage(Map<String, Object> map);
	
	// 학생 페이징 카운트
	int selectStudentCount();						
	
	// 학생 상세정보
	Student selectStudentOne(String steudentId);	
	
	// 강사 이미지 조회
	public MypageImage selectStudentImage(String teacherId);
	
	// 학생 승인 대기 목록
	public List<StudentQueue> selectStudentQueueListByPage(Map<String,Object> map);
	
	// 학생 승인 대기 페이징 카운트
	public int selectStudentQueueCount();
	
	// 학생 승인 거절
	public int deleteStudentQueue(String studentId);
	public int deleteAccount(String accountId);
	
	// 학생 승인과 상태 업데이트
	public int updateAccountState(Account account); 
	
	// 학생 승인대기 상세
	public Student selectStudentQueueOne(String accountId);
	
	// 학생 테이블 추가
	public int insertStudent(Student student);
}
