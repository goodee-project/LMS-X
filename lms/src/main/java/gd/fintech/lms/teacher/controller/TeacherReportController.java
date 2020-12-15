package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.teacher.service.TeacherReportService;
import gd.fintech.lms.vo.Report;

@Controller
public class TeacherReportController {
	@Autowired TeacherReportService teacherReportService;
	
	// 강사가 해당 강의실에서 출제한 과제 목록
	@GetMapping(value="/auth/teacher/lecture/{lectureNo}/report/reportList/{currentPage}")
	public String reportList(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo, 
			@PathVariable(value = "currentPage") int currentPage) {
		int rowPerPage = 10;	// 한 페이지에 표시할 데이터 수
		
		List<Report> teacherReportList = teacherReportService.getTeacherReportListByPage(lectureNo, currentPage, rowPerPage);
		System.out.println("Debug: teacherReportList - " + teacherReportList);
		
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
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("teacherReportList", teacherReportList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		// view의 /auth/teacher/lecture/report/reportList.jsp를 이용한다
		return "/auth/teacher/lecture/report/reportList";
	}
}
