package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherReportMapper;
import gd.fintech.lms.vo.Report;
import gd.fintech.lms.vo.ReportSubmit;

@Service
@Transactional
public class TeacherReportService {
	@Autowired private TeacherReportMapper teacherReportMapper;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 강사가 출제한 과제 목록
	// 강좌 고유번호(lectureNo)
	public List<Report> getTeacherReportListByPage(int lectureNo, int beginRow, int rowPerPage) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("lectureNo", lectureNo);		// 강의실 고유번호
		map.put("beginRow", beginRow);			// 시작 데이터
		map.put("rowPerPage", rowPerPage);		// 한 페이지당 표시할 데이터 수
		
		List<Report> teacherReportList = teacherReportMapper.selectTeacherReportListByPage(map);
		
		// [Logger] 출제 과제 목록(teacherReportList)
		logger.trace("teacherReportList[" + teacherReportList + "]");
		
		return teacherReportList;
	}
	
	// 강사가 출제한 과제의 총 개수 계산
	// 강좌 고유번호(lectureNo)
	public int getCountTeacherReport(int lectureNo) {
		return teacherReportMapper.selectTeacherReportListCount(lectureNo);
	}
	
	// 강사가 출제한 과제에 대한 정보
	// 과제 고유번호(reportNo)
	public Report getTeacherReportOne(int reportNo) {
		return teacherReportMapper.selectTeacherReportOne(reportNo);
	}
	
	public Report insertTeacherReport(Report report) {
		teacherReportMapper.insertTeacherReport(report);
		
		Report returnReport = new Report();
		
		// 과제 고유번호(reportNo)
		returnReport.setReportNo(report.getReportNo());
		
		return returnReport;
	}
	
	public void updateTeacherReport(Report report) {
		teacherReportMapper.updateTeacherReport(report);
	}
	
	// 학생들이 제출한 과제에 대한 목록
	// 과제 고유번호(reportNo)
	public List<ReportSubmit> getTeacherReportSubmitList(int lectureNo, int reportNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);			// 강좌 고유번호
		map.put("reportNo", reportNo);				// 학생 과제 제출 고유번호
		
		List<ReportSubmit> reportSubmitList = teacherReportMapper.selectTeacherReportSubmitList(map);
		return reportSubmitList;
	}
}
