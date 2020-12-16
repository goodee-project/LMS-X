package gd.fintech.lms.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import gd.fintech.lms.student.service.StudentLectureNoticeService;
import gd.fintech.lms.vo.LectureNotice;

@Controller
public class StudentLectureNoticeController {
	@Autowired private StudentLectureNoticeService studentLectureNoticeService;
	
	// 학생이 강의 공지사항 리스트를 확인
	@GetMapping("/auth/student/lectureNotice/lectureNoticeList/{lectureNo}/{currentPage}")
	public String StudentLectureNoticeList(Model model,
			@PathVariable(name = "currentPage", required = true) int currentPage,
			@PathVariable(name = "lectureNo", required = true)int lectureNo) {
		int rowPerPage = 20; // 한 페이지에 출력할 게시물의 개수는 20개입니다
		int endPage = studentLectureNoticeService.getCountLectureNotice(rowPerPage); // 마지막 페이지
		int beginRow = (currentPage - 1) * rowPerPage; //시작 페이지
		
		int navPerPage = 10; // 네비에 출력될 페이지 개수
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1; // 네비의 첫 페이지 
		int navLastPage = navFirstPage + navPerPage - 1; // 네비의 마지막 페이지
		
		// 현재 페이지가 10으로 나누어 떨어질 때
		if (currentPage % navPerPage == 0 && currentPage != 0) {
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
		
		//공지사항 리스트 출력
		Map<String, Object> map = new HashMap<>();
		map.put("lectureNo", lectureNo);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		List<LectureNotice> lectureNotice = studentLectureNoticeService.getStudentLectureNoticeListByPage(map);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("lectureNotice", lectureNotice);
		
		return "auth/student/lectureNotice/lectureNoticeList";
	}
	
	//공지사항 상세보기
	@GetMapping("/auth/student/lectureNotice/lectureNoticeOne/{lectureNo}/{lectureNotcieNo}")
	public String lectureNoticeOne(Model model,
			@PathVariable(value = "lectureNo") int lectureNo,
			@PathVariable(value = "lectureNotcieNo") int lectureNoticeNo) {
		LectureNotice lectureNotice = studentLectureNoticeService.getStudentLectureNoticeOne(lectureNoticeNo);
		model.addAttribute("lectureNotice", lectureNotice);
		return "/auth/student/lectureNotice/lectureNoticeOne";
	}
}
