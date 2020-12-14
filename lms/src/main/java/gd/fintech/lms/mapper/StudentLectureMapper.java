package gd.fintech.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.LectureAndClassRegistration;

@Mapper
public interface StudentLectureMapper {
	// 학생 : 자신이 수강중인 강좌 목록
	public List<LectureAndClassRegistration> selectStudentClassListByPage(Map<String, Object> map);
	// 학생 : 자신이 수강중인 강좌의 개수
	public int selectStudentClassListCount(String studentId);
}
