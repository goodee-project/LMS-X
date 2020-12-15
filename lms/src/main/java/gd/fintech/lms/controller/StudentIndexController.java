package gd.fintech.lms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.service.StudentLectureService;
import gd.fintech.lms.vo.LectureAndClassRegistration;

// 학생 강좌 컨트롤러
@Controller
public class StudentIndexController {
	@Autowired StudentLectureService studentLectureService;
	
	// 학생 인덱스
	@GetMapping("/auth/student/index/{studentId}/{currentPage}")
	public String index(Model model,
			@PathVariable(name="studentId") String studentId,
			@PathVariable(name="currentPage") int currentPage) {
		int rowPerPage = 2; // 한페이지에 출력할 개수
		int endPage = studentLectureService.selectStudentClassListEndPage(studentId, rowPerPage); // 마지막 페이지
		int beginRow = (currentPage - 1) * rowPerPage; // 시작 페이지
		// 강좌 목록 가져오기
		Map<String, Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		List<LectureAndClassRegistration> lectureList = studentLectureService.selectStudentClassListByPage(map);

		
		int navPerPage = 10; // 네비에 출력될 페이지 개수
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1; // 네비의 첫 페이지 
		int navLastPage = navFirstPage + navPerPage - 1; // 네비의 마지막 페이지
		
		// 현재 페이지가 10으로 나누어 떨어질 때
		if (currentPage % navPerPage == 0 && currentPage != 0) {
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("lectureList", lectureList);
		return "auth/student/index";
	}
}
