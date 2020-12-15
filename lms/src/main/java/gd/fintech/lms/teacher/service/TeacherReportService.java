package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherReportMapper;
import gd.fintech.lms.vo.Report;

@Service
@Transactional
public class TeacherReportService {
@Autowired private TeacherReportMapper teacherReportMapper;
	
	// 강사가 출제한 과제 목록을 출력
	public List<Report> getTeacherReportListByPage(int lectureNo, int currentPage, int rowPerPage) {
		// currentPage, rowPerPage를 통해 beginRow, rowPerPage 전달하여
		// TeacherReportMapper의 메소드를 호출한다.
		// 이후 결과값을 받아 return 한다.
		
		int beginRow = (currentPage - 1) * rowPerPage;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("lectureNo", lectureNo);		// 강의실 고유번호
		map.put("beginRow", beginRow);			// 시작 데이터
		map.put("rowPerPage", rowPerPage);		// 한 페이지당 표시할 데이터 수
		
		List<Report> teacherReportList = teacherReportMapper.selectTeacherReportListByPage(map);
		
		return teacherReportList;
	}
	
	// 강사가 출제한 과제의 총 갯수 계산
	public int getCountTeacherReport(int lectureNo) {
		return teacherReportMapper.selectTeacherReportListCount(lectureNo);
	}
}
