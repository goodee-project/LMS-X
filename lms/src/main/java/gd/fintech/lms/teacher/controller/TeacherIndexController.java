package gd.fintech.lms.teacher.controller;

import java.util.List;

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

import gd.fintech.lms.teacher.service.TeacherLectureService;
import gd.fintech.lms.vo.Lecture;

@Controller
public class TeacherIndexController {
	@Autowired TeacherLectureService teacherLectureService;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 강사 Index
	@GetMapping(value="/auth/teacher/index/{currentPage}")
	public String index(ServletRequest request, Model model, 
			@PathVariable(value = "currentPage") int currentPage) {
		// 세션 정보를 가져온다.
		HttpSession session = ((HttpServletRequest)request).getSession();
		
		// 세션에 있는 아이디를 가져온다 (강사)
		String teacherId = (String)session.getAttribute("loginId");
		
		// [Logger] 세션에 있는 teacherId 확인
		logger.trace("Debug: nowSessionId[" + teacherId + "]");
		
		// 한 페이지에 표시할 데이터 수
		int rowPerPage = 10;
		
		// [Logger] 데이터베이스로부터 강사가 속해있는 강좌 목록을 가져온다
		List<Lecture> teacherLectureList = teacherLectureService.getTeacherLectureListByPage(teacherId, currentPage, rowPerPage);
		logger.trace("Debug: teacherLectureList - " + teacherLectureList);
		
		// 페이징 코드
		// 전체 데이터 수
		int totalCount = teacherLectureService.getCountTeacherLecture(teacherId);
		
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
		model.addAttribute("teacherLectureList", teacherLectureList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		// view의 /auth/teacher/index.jsp를 이용한다
		return "/auth/teacher/index";
	}
}
