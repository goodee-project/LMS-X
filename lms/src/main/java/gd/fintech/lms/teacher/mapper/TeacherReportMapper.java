package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Report;

@Mapper
public interface TeacherReportMapper {
	// 강사 과제 목록 페이지에서 목록 페이징
	List<Report> selectTeacherReportListByPage(Map<String, Integer> map);
	
	// 강사 과제 목록 페이지 카운트
	int selectTeacherReportListCount(int lectureNo);	// 강의실 고유번호를 받아온다
}
