package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Student;

@Mapper
public interface TeacherLectureStudentMapper {

	// 강의를 듣는 학생 리스트
	List<Student> selectTeacherStudentListByLecture(Map<String, Object>map);
	
	// 강의를 듣는 학생 상세보기
	Student selectTeacherLectureStudentOne(int StudentId);
}
