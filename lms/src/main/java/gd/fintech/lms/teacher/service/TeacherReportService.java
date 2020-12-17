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
	// 강좌 고유번호(lectureNo)를 이용
	public List<Report> getTeacherReportListByPage(int lectureNo, int beginRow, int rowPerPage) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("lectureNo", lectureNo);		// 강의실 고유번호
		map.put("beginRow", beginRow);			// 시작 데이터
		map.put("rowPerPage", rowPerPage);		// 한 페이지당 표시할 데이터 수
		
		List<Report> teacherReportList = teacherReportMapper.selectTeacherReportListByPage(map);
		
		return teacherReportList;
	}
	
	// 강사가 출제한 과제의 총 갯수 계산
	// 강좌 고유번호(lectureNo)를 이용
	public int getCountTeacherReport(int lectureNo) {
		return teacherReportMapper.selectTeacherReportListCount(lectureNo);
	}
	
	// 강사가 출제한 과제에 대한 정보를 출력
	// 과제 고유번호(reportNo)를 이용
	public Report getTeacherReportOne(int reportNo) {
		return teacherReportMapper.selectTeacherReportOne(reportNo);
	}
	
	public Report insertTeacherReport(Report report) {
		teacherReportMapper.insertTeacherReport(report);
		
		Report returnReport = new Report();
		returnReport.setReportNo(report.getReportNo());		// reportNo Autoincrement 번호를 받아온다.
		
		return returnReport;
	}
	
	public void updateTeacherReport(Report report) {
		teacherReportMapper.updateTeacherReport(report);
	}
}
