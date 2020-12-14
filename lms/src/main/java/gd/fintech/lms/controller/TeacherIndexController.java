package gd.fintech.lms.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.service.TeacherLectureService;
import gd.fintech.lms.vo.Lecture;

@Controller
public class TeacherIndexController {
	@Autowired TeacherLectureService teacherLectureService;
	
	// 강사 Index
	@GetMapping(value="/auth/teacher/index/{currentPage}")
	public String index(ServletRequest request, Model model, 
			@PathVariable(value = "currentPage") int currentPage) {
		HttpSession session = ((HttpServletRequest)request).getSession();	// 세션 정보를 가져온다.
		
		// String accountId = session.getAttribute("loginId").toString();		// 세션에 있는 아이디를 가져온다 (강사)
		String accountId = "sunghyun";
		
		int rowPerPage = 10;	// 한 페이지에 표시할 데이터 수
		
		List<Lecture> teacherLectureList = teacherLectureService.getTeacherLectureListByPage(accountId, currentPage, rowPerPage);
		
		// 페이징 코드
		int totalCount = teacherLectureService.getCountTeacherLecture(accountId);	// 전체 데이터 수
		int lastPage = totalCount / rowPerPage;	// 마지막 페이지
		
		if (totalCount % rowPerPage != 0) {	// 10 미만의 개수의 데이터가 있는 페이지를 표시
			lastPage += 1;
		}
		
		if (lastPage == 0) { // 전체 페이지가 0개이면 현재 페이지도 0으로 표시
			currentPage = 0;
		}
		
		int navPerPage = 10;	// 네비게이션에 표시할 페이지 수
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;	// 네비게이션 첫번째 페이지
		int navLastPage = navFirstPage + navPerPage - 1;	// 네비게이션 마지막 페이지
		
		if (currentPage % navPerPage == 0 && currentPage != 0) {	// 10으로 나누어 떨어지는 경우 처리하는 코드
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
		
		model.addAttribute("teacherLectureList", teacherLectureList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		return "/auth/teacher/index";
	}
}
