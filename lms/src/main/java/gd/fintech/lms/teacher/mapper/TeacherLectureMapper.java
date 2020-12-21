package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.LectureNotice;

@Mapper
public interface TeacherLectureMapper {
	// 강좌 목록
	// 강사 아이디(teacherId), 시작 데이터 번호(beginRow), 페이지당 표시 데이터 수(rowPerPage)
	List<Lecture> selectTeacherLectureListByPage(Map<String, Object> map);
	
	// 강좌 데이터 수 조회
	// 강사 아이디(teacherId)
	int selectTeacherLectureListCount(String teacherId);
	
	// 강좌 조회
	// 강좌 고유번호(lectureNo)
	Lecture selectTeacherLectureOne(int lectureNo);
}
