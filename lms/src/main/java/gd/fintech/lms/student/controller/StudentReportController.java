package gd.fintech.lms.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.student.service.StudentReportService;
import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.LectureAndClassRegistrationAndSubject;
import gd.fintech.lms.vo.Report;
import gd.fintech.lms.vo.ReportSubmit;
import gd.fintech.lms.vo.ReportSubmitFile;
import gd.fintech.lms.vo.ReportSubmitForm;

@Controller
public class StudentReportController {
	@Autowired StudentReportService studentReportService;

	// Logger
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 강사가 출제한 과제 목록
	@GetMapping("auth/student/lecture/{lectureNo}/report/reportList/{currentPage}")
	public String reportList(Model model,
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "currentPage") int currentPage) {

		int rowPerPage = 10; // 한페이지에 출력할 개수
		int totalCount = studentReportService.selectStudentReportListEndPage(lectureNo); // 마지막 페이지
		int beginRow = (currentPage - 1) * rowPerPage; // 시작 페이지

		// 마지막 페이지 구하기
		int lastPage = 0;
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		} else {
			lastPage = totalCount / rowPerPage + 1;			
		}

		// 전체 페이지가 0개이면 현재 페이지도 0으로 표시
		if (lastPage == 0) {
			currentPage = 0;
		}
		// 맵에 페이지 정보 추가
		Map<String, Object> map = new HashMap<>();
		map.put("lectureNo", lectureNo);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		// 과제 목록 가져오기
		List<Report> reportList = studentReportService.selectReportListByPage(map);
		
		int navPerPage = 10; // 네비에 출력될 페이지 개수
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1; // 네비의 첫 페이지 
		int navLastPage = navFirstPage + navPerPage - 1; // 네비의 마지막 페이지

		// 현재 페이지가 10으로 나누어 떨어질 때
		if (currentPage % navPerPage == 0 && currentPage != 0) {
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}

		// 현재 페이지가 10으로 나누어 떨어질 때
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
		
		// 뷰 연결
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		model.addAttribute("reportList", reportList);
		model.addAttribute("lectureNo", lectureNo);
		return "/auth/student/lecture/report/reportList";
	}
	
	// 과제 상세보기 
	// - 강사가 출제한 과제 내용과 학생이 제출한 과제 내용을 같이 출력함 
	@GetMapping("auth/student/lecture/{lectureNo}/report/reportOne/{reportNo}")
	public String reportOne(Model model,ServletRequest request,
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "reportNo") int reportNo) {
		// 세션에서 아이디 가져오기
		HttpSession session = ((HttpServletRequest)request).getSession();	
		String accountId = (String)session.getAttribute("loginId");
		
		// 출제된 과제 가져오기
		Report report = studentReportService.selectReportOne(reportNo);
		// 제출한 과제 가져오기
		ReportSubmit paramReportSubmit = new ReportSubmit();
		paramReportSubmit.setAccountId(accountId);
		paramReportSubmit.setReportNo(reportNo);
		ReportSubmit reportSubmit = studentReportService.selectReportSubmitOne(paramReportSubmit);
		
		// 제출된 과제가 없다면 과제 제출 폼으로 이동
		if (reportSubmit == null) {
			return "redirect:/auth/student/lecture/" + lectureNo + "/report/insertReport/" + reportNo;
		}
		
		model.addAttribute("lectureNo", lectureNo);
		model.addAttribute("report", report);
		model.addAttribute("reportSubmit", reportSubmit);
		
		return "/auth/student/lecture/report/reportOne";
	}
	
	// 과제 제출하는 폼
	@GetMapping("auth/student/lecture/{lectureNo}/report/insertReport/{reportNo}")
	public String insertReport(Model model,
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "reportNo") int reportNo) {
		
		// 출제된 과제 가져오기
		Report report = studentReportService.selectReportOne(reportNo);

		model.addAttribute("lectureNo", lectureNo);
		model.addAttribute("report", report);
		
		return "/auth/student/lecture/report/insertReport";
	}
	
	// 과제 제출 액션
	@PostMapping("auth/student/lecture/{lectureNo}/report/insertReport")
	public String insertReport(ReportSubmitForm reportSubmitForm, ServletRequest request,
			@PathVariable(name = "lectureNo") int lectureNo) {
		// 세션에서 아이디 가져오기
		HttpSession session = ((HttpServletRequest)request).getSession();	
		String accountId = (String)session.getAttribute("loginId");
		reportSubmitForm.setAccountId(accountId);

		// logger
		logger.trace("reportSubmitForm["+reportSubmitForm+"]");
		
		studentReportService.insertReportSubmit(reportSubmitForm);
		
		return "redirect:/auth/student/lecture/" + lectureNo + "/report/reportOne/" + reportSubmitForm.getReportNo();
	}
}
