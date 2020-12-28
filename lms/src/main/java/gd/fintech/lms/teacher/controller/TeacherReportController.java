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
import gd.fintech.lms.vo.ReportSubmit;

@Controller
public class TeacherReportController {
	@Autowired TeacherReportService teacherReportService;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 강사 과제 목록
	@GetMapping("/auth/teacher/lecture/{lectureNo}/report/reportList/{currentPage}")
	public String reportList(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo, 			// 강좌 고유번호
			@PathVariable(value = "currentPage") int currentPage) {		// 현재 페이지
		// 한 페이지에 표시할 데이터 수
		int rowPerPage = 10;
		
		// 시작 페이지 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		
		List<Report> teacherReportList = teacherReportService.getTeacherReportListByPage(lectureNo, beginRow, rowPerPage);
		
		// [Logger] 과제 목록(teacherReportList)
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
		if (nextPage > lastPage) {
			nextPage = lastPage;
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
		
		// [View] /auth/teacher/lecture/report/reportList.jsp
		return "/auth/teacher/lecture/report/reportList";
	}
	
	// 과제 조회
	@GetMapping("/auth/teacher/lecture/{lectureNo}/report/reportOne/{reportNo}")
	public String reportOne(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo, 
			@PathVariable(value = "reportNo") int reportNo) {
		// 과제 고유번호(reportNo)에 해당하는 과제의 정보를 데이터베이스에서 가져온다
		Report report = teacherReportService.getTeacherReportOne(reportNo);
		
		// [Logger] 과제(report) 확인
		logger.trace("report[" + report + "]");
		
		// 과제 고유번호(reportNo)에 해당하는 학생 과제 제출 목록을 데이터베이스에서 가져온다
		List<ReportSubmit> reportSubmitList = teacherReportService.getTeacherReportSubmitList(lectureNo, reportNo);
		
		// [Logger] 학생 과제 제출 목록(List<ReportSubmit>) 확인
		logger.trace("reportSubmitList[" + reportSubmitList + "]");
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("report", report);
		model.addAttribute("reportSubmitList", reportSubmitList);
		
		// [View] /auth/teacher/lecture/report/reportOne.jsp
		return "/auth/teacher/lecture/report/reportOne";
	}
	
	// 과제 작성 Form
	@GetMapping("/auth/teacher/lecture/{lectureNo}/report/insertReport")
	public String insertReport(@PathVariable(value = "lectureNo") int lectureNo) {
		// [View] /auth/teacher/lecture/report/insertReport.jsp
		return "/auth/teacher/lecture/report/insertReport";
	}
	
	// 과제 작성 Action
	@PostMapping("/auth/teacher/lecture/{lectureNo}/report/insertReport")
	public String insertReport(Report report) {
		Report returnReport = teacherReportService.insertTeacherReport(report);
		
		// [Logger] 과제(report) 확인
		logger.trace("report[" + report + "]");
		
		// [Redirect] 과제 작성 후 과제 고유번호에 해당하는 게시글로 이동
		return "redirect:/auth/teacher/lecture/" + report.getLectureNo() + "/report/reportOne/" + returnReport.getReportNo();
	}
	
	// 과제 수정 Form
	@GetMapping("/auth/teacher/lecture/{lectureNo}/report/updateReport/{reportNo}")
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
		
		// [View] /auth/teacher/lecture/report/updateReport.jsp
		return "/auth/teacher/lecture/report/updateReport";
	}
	
	// 과제 수정 Action
	@PostMapping("/auth/teacher/lecture/{lectureNo}/report/updateReport/{reportNo}")
	public String updateReport(Report report) {
		teacherReportService.updateTeacherReport(report);
		
		// [Logger] 과제(report) 확인
		logger.trace("report[" + report + "]");
		
		// [Redirect] 과제 수정 후 과제 고유번호에 해당하는 게시글로 이동
		return "redirect:/auth/teacher/lecture/" + report.getLectureNo() + "/report/reportOne/" + report.getReportNo();
	}
	
	// 학생 과제 제출 조회
	@GetMapping("/auth/teacher/lecture/{lectureNo}/report/reportOne/{reportNo}/reportSubmitOne/{reportSubmitNo}")
	public String reportSubmitOne(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo, 
			@PathVariable(value = "reportNo") int reportNo, 
			@PathVariable(value = "reportSubmitNo") int reportSubmitNo) {
		// 과제 제출 고유번호(reportSubmitNo)에 해당하는 과제의 정보를 데이터베이스에서 가져온다
		List<ReportSubmit> reportSubmit = teacherReportService.selectTeacherReportSubmitOne(reportSubmitNo);
		
		// [Logger] 과제 제출(reportSubmit) 확인
		logger.trace("reportSubmit[" + reportSubmit + "]");
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("reportSubmit", reportSubmit);
		
		// [View] /auth/teacher/lecture/report/reportSubmitOne.jsp
		return "/auth/teacher/lecture/report/reportSubmitOne";
	}
	
	// 학생 과제 평가 입력 Form
	@GetMapping("/auth/teacher/lecture/{lectureNo}/report/reportOne/{reportNo}/insertReportSubmit/{reportSubmitNo}")
	public String insertReportSubmit(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo, 
			@PathVariable(value = "reportNo") int reportNo, 
			@PathVariable(value = "reportSubmitNo") int reportSubmitNo) {
		
		
		// [View] /auth/teacher/lecture/report/insertReportSubmit.jsp
		return "/auth/teacher/lecture/report/insertReportSubmit";
	}
	
	// 학생 과제 평가 입력 Action
	@PostMapping("/auth/teacher/lecture/{lectureNo}/report/reportOne/{reportNo}/insertReportSubmit/{reportSubmitNo}")
	public String insertReportSubmit() {
		
		return "redirect:/";
	}
	
	// 학생 과제 평가 수정 Form
	@GetMapping("/auth/teacher/lecture/{lectureNo}/report/reportOne/{reportNo}/updateReportSubmit/{reportSubmitNo}")
	public String updateReportSubmit(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo, 
			@PathVariable(value = "reportNo") int reportNo, 
			@PathVariable(value = "reportSubmitNo") int reportSubmitNo) {
		
		// [View] /auth/teacher/lecture/report/updateReportSubmit.jsp
		return "/auth/teacher/lecture/report/updateReportSubmit";
	}
	
	// 학생 과제 평가 입력 Action
	@PostMapping("/auth/teacher/lecture/{lectureNo}/report/reportOne/{reportNo}/updateReportSubmit/{reportSubmitNo}")
	public String updateReportSubmit(ReportSubmit reportSubmit) {
		
		return "redirect:/";
	}
}
