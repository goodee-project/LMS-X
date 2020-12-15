package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Lecture;

@Mapper
public interface TeacherLectureMapper {
	// 강사 강좌 목록 페이지에서 목록 페이징
	// 강사 아이디(teacherId), 시작 데이터 번호(beginRow), 페이지당 표시 데이터 수(rowPerPage)를 이용
	List<Lecture> selectTeacherLectureListByPage(Map<String, Object> map);
	
	// 강사 강좌 목록 페이지 카운트
	// 강사 아이디(teacherId)를 이용
	int selectTeacherLectureListCount(String teacherId);
	
	// 각 강좌별 정보를 출력
	// 강좌 고유번호(lectureNo)를 이용
	Lecture selectTeacherLectureOne(int lectureNo);
}
