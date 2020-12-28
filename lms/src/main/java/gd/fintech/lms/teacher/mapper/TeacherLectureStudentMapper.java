package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Attendance;
import gd.fintech.lms.vo.LectureAndStudentAndClassRegistration;

@Mapper
public interface TeacherLectureStudentMapper {

	// 강의를 듣는 학생 리스트
	public List<LectureAndStudentAndClassRegistration> selectTeacherLectureStudentListByPage(Map<String, Object> map);
	
	// 강의를 듣는 학생 상세보기
	public LectureAndStudentAndClassRegistration selectTeacherLectureStudentOne(Map<String, Object> map);
	
	// 강의를 듣는 학생 수
	public int selectTeacherLectureStudentCount(Map<String, Object> map);
	
	// 강의를 듣는 학생 상세보기 - 월별 출결 현황
	List<Map<String, Object>> selectTeacherAttendanceByStudentAndMonth(Map<String, Object> map);
	
	// 강의를 듣는 학생 상세보기 - 일별 출결 현황
	List<Attendance> selectTeacherAttendanceByStudentAndDay(Map<String, Object> map);
}
