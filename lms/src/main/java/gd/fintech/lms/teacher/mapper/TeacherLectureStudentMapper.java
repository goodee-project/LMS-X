package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Attendance;
import gd.fintech.lms.vo.LectureAndStudentAndClassRegistration;
import gd.fintech.lms.vo.License;

@Mapper
public interface TeacherLectureStudentMapper {

	// 강의를 듣는 학생 리스트
	public List<LectureAndStudentAndClassRegistration> selectTeacherLectureStudentListByPage(Map<String, Object> map);
	
	// 강의를 듣는 학생 상세보기
	public LectureAndStudentAndClassRegistration selectTeacherLectureStudentOne(Map<String, Object> map);
	
	// 강의를 듣는 학생 이미지
	public String selectTeacherLecureStudentOneImage(String accountId);
	
	// 강의를 듣는 학생 자격증
	public List<License> selectTeacherLecureStudentOneLicese(String accountId);
	
	// 강의를 듣는 학생 수
	public int selectTeacherLectureStudentCount(Map<String, Object> map);
	
	// 강의를 듣는 학생 상세보기 - 월별 출결 현황
	List<Attendance> selectTeacherAttendanceByStudentAndMonth(Map<String, Object> map);
}
