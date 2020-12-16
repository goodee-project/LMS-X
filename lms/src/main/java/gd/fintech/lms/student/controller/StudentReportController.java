package gd.fintech.lms.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.student.service.StudentReportService;
import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.LectureAndClassRegistrationAndSubject;
import gd.fintech.lms.vo.Report;

@Controller
public class StudentReportController {
	@Autowired StudentReportService studentReportService;
	
	// 강사가 출제한 과제 목록
	@GetMapping("auth/student/report/reportList/{classNo}/{currentPage}")
	public String reportList(Model model,
			@PathVariable(name="classNo") int classNo,
			@PathVariable(name="currentPage") int currentPage) {

		int rowPerPage = 10; // 한페이지에 출력할 개수
		int endPage = studentReportService.selectStudentReportListEndPage(classNo, rowPerPage); // 마지막 페이지
		int beginRow = (currentPage - 1) * rowPerPage; // 시작 페이지
		
		// 맵에 페이지 정보 추가
		Map<String, Object> map = new HashMap<>();
		map.put("classNo", classNo);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		// 과제 목록 가져오기
		ClassRegistration reportList = studentReportService.selectReportListByPage(map);
		
		int navPerPage = 10; // 네비에 출력될 페이지 개수
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1; // 네비의 첫 페이지 
		int navLastPage = navFirstPage + navPerPage - 1; // 네비의 마지막 페이지

		// 현재 페이지가 10으로 나누어 떨어질 때
		if (currentPage % navPerPage == 0 && currentPage != 0) {
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
		
		// 뷰 연결
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);

		model.addAttribute("classNo", reportList.getClassRegistrationNo());
		
		model.addAttribute("reportList", reportList);
		return "/auth/student/report/reportList";
	}
}
