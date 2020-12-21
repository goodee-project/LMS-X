package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.StudentQueue;

@Mapper
public interface ManagerStudentMapper {
	// 학생 리스트
	public List<Map<String, Object>> selectStudentListByPage(Map<String, Object> map);
	
	// 학생 페이징 카운트
	int selectStudentCount();						
	
	// 학생 상세정보
	Student selectStudentOne(String steudentId);	
	
	// 학생 승인 대기 목록
	public List<StudentQueue> selectStudentQueueListByPage(Map<String,Object> map);
	
	// 학생 승인 대기 페이징 카운트
	public int selectStudentQueueCount();
}
