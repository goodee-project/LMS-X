package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LectureAndStudentAndClassRegistration;

@Mapper
public interface TeacherLectureStudentMapper {

	// 강의를 듣는 학생 리스트
	public List<LectureAndStudentAndClassRegistration> selectTeacherLectureStudentListByPage(Map<String, Object> map);
	
	// 강의를 듣는 학생 상세보기
	public LectureAndStudentAndClassRegistration selectTeacherLectureStudentOne(Map<String, Object> map);
	
	// 강의를 듣는 학생 수
	public int selectTeacherLectureStudentCount(Map<String, Object> map);
}
