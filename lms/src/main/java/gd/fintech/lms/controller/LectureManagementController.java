package gd.fintech.lms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.service.LectureManagementService;
import gd.fintech.lms.vo.Lecture;

@Controller
public class LectureManagementController {
	@Autowired private LectureManagementService lectureManagementService;
	
	//운영자가 추가한 강의 목록 리스트
	@GetMapping("/auth/manager/lectureManagementList/{currnetPage}")
	public String lectureManagementList(Model model,
			@PathVariable(name = "currentPage", required = true) int currentPage) {
		int rowPerPage = 10; //한 페이지에 출력할 개수
		int endPage = lectureManagementService.getCountLecture(rowPerPage); //마지막 페이지
		int beginRow = (currentPage - 1) * rowPerPage; // 시작 페이지
		// 강의 목록 출력
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		List<Lecture> lectureManagementList = lectureManagementService.getLectureListByPage(map);
		
		int navPerPage = 10; // 네비에 출력할 페이지 개수
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1; // 네비의 첫번째 페이지
		int navLastPage = navFirstPage + navPerPage - 1; // 네비의 마지막 페이지
		//현재 페이지가 10으로 나누어 떨어질 때
		if (currentPage % navPerPage == 0 && currentPage != 0) {
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("lectureManagementList", lectureManagementList);
		
		return "lectureManagementList";
	}
	// 강의 개설 액션 
	@PostMapping("/auth/manager/insertLecture")
	public String insertLecture(Lecture lecture) { // 커맨트 객체
		lectureManagementService.insertLecture(lecture);
		return "redirect:/lectureManagementList";
	}
	// 강의 개설 폼
	@GetMapping("/auth/manager/insertLecture")
	public String insertLecture() {
		return null;
	}
}
