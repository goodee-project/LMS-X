package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.teacher.service.TeacherReportService;
import gd.fintech.lms.vo.Report;

@Controller
public class TeacherReportController {
	@Autowired TeacherReportService teacherReportService;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 강사가 해당 강의실에서 출제한 과제 목록
	@GetMapping(value="/auth/teacher/lecture/{lectureNo}/report/reportList/{currentPage}")
	public String reportList(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo, 
			@PathVariable(value = "currentPage") int currentPage) {
		int rowPerPage = 10;	// 한 페이지에 표시할 데이터 수
		
		List<Report> teacherReportList = teacherReportService.getTeacherReportListByPage(lectureNo, currentPage, rowPerPage);
		
		// [Logger] 과제 목록(teacherReportList) 확인
		logger.trace("teacherReportList[" + teacherReportList + "]");
		
		// 페이징 코드
		// 전체 데이터 수
		int totalCount = teacherReportService.getCountTeacherReport(lectureNo);
		
		// 마지막 페이지
		int lastPage = totalCount / rowPerPage;
		
		// 10 미만의 개수의 데이터가 있는 페이지를 표시
		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		
		// 전체 페이지가 0개이면 현재 페이지도 0으로 표시
		if (lastPage == 0) {
			currentPage = 0;
		}
		
		// 내비게이션에 표시할 페이지 수
		int navPerPage = 10;
		
		// 내비게이션 첫번째 페이지
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;	
		
		// 내비게이션 마지막 페이지
		int navLastPage = navFirstPage + navPerPage - 1;
		
		// 10으로 나누어 떨어지는 경우 처리하는 코드
		if (currentPage % navPerPage == 0 && currentPage != 0) {
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
		
		// 현재 페이지에 대한 이전 페이지
		int prePage;
		if (currentPage > 10) {
			prePage = currentPage - (currentPage % navPerPage) + 1 - 10;
		} else {
			prePage = 1;
		}
		
		// 현재 페이지에 대한 다음 페이지
		int nextPage = currentPage - (currentPage % navPerPage) + 1 + 10;
		if (nextPage > totalCount) {
			nextPage = totalCount;
		}
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("teacherReportList", teacherReportList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		// view의 /auth/teacher/lecture/report/reportList.jsp를 이용한다
		return "/auth/teacher/lecture/report/reportList";
	}
	
	// 강사가 제출한 과제에 대한 정보 조회
	@GetMapping(value="/auth/teacher/lecture/{lectureNo}/report/reportOne/{reportNo}")
	public String reportOne(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo, 
			@PathVariable(value = "reportNo") int reportNo) {
		// 과제 고유번호(reportNo)에 해당하는 과제의 정보를 데이터베이스에서 가져온다
		Report report = teacherReportService.getTeacherReportOne(reportNo);
		
		// [Logger] 과제(report) 확인
		logger.trace("report[" + report + "]");
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("report", report);
		
		// view의 /auth/teacher/lecture/report/reportOne.jsp를 이용한다
		return "/auth/teacher/lecture/report/reportOne";
	}
	
	// 강좌 고유번호(lectureNo)에 해당하는 강좌에 강사가 새로운 과제를 출제 (Form)
	@GetMapping(value="/auth/teacher/lecture/{lectureNo}/report/insertReport")
	public String insertReport(@PathVariable(value = "lectureNo") int lectureNo) {
		return "/auth/teacher/lecture/report/insertReport";
	}
	
	// 강좌 고유번호(lectureNo)에 해당하는 강좌에 강사가 새로운 과제를 출제 (Action)
	@PostMapping(value="/auth/teacher/lecture/{lectureNo}/report/insertReport")
	public String insertReport(Report report) {
		Report returnReport = teacherReportService.insertTeacherReport(report);
		
		// [Logger] 과제(report) 확인
		logger.trace("report[" + report + "]");
		
		return "redirect:/auth/teacher/lecture/" + report.getLectureNo() + "/report/reportOne/" + returnReport.getReportNo();
	}
	
	// 과제 고유번호(reportNo)에 해당하는 과제에 대한 정보를 수정 (Form)
	@GetMapping(value="/auth/teacher/lecture/{lectureNo}/report/updateReport/{reportNo}")
	public String updateReport(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo, 
			@PathVariable(value = "reportNo") int reportNo) {
		// 과제 고유번호(reportNo)에 해당하는 과제의 정보를 데이터베이스에서 가져온다
		Report report = teacherReportService.getTeacherReportOne(reportNo);
		// reportStartDate의 String 형태를 yyyy-MM-ddThh:mm 형식으로 변환한다
		report.setReportStartdate(report.getReportStartdate().replace(" ", "T"));
		// reportEndDate의 String 형태를 yyyy-MM-ddThh:mm 형식으로 변환한다
		report.setReportEnddate(report.getReportEnddate().replace(" ", "T"));
		
		// [Logger] 과제(report) 확인
		logger.trace("report[" + report + "]");
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("report", report);
		
		return "/auth/teacher/lecture/report/updateReport";
	}
	
	// 과제 고유번호(reportNo)에 해당하는 과제에 대한 정보를 수정 (Action)
	@PostMapping(value="/auth/teacher/lecture/{lectureNo}/report/updateReport/{reportNo}")
	public String updateReport(Report report, 
			@PathVariable(value = "lectureNo") int lectureNo, 
			@PathVariable(value = "reportNo") int reportNo) {
		teacherReportService.updateTeacherReport(report);
		
		// [Logger] 과제(report) 확인
		logger.trace("report[" + report + "]");
		
		return "redirect:/auth/teacher/lecture/" + report.getLectureNo() + "/report/reportOne/" + report.getReportNo();
	}
}
