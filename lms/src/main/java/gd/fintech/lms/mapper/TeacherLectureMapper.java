package gd.fintech.lms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Lecture;

@Mapper
public interface TeacherLectureMapper {
	// 강사 강좌 목록 페이지에서 목록 페이징
	List<Lecture> selectTeacherLectureListByPage(Map<String, Object> map);
	
	// 강사 강좌 목록 페이지 카운트
	int selectTeacherLectureListCount(String teacherId);	// 강사 아이디를 받아온다
}
