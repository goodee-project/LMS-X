package gd.fintech.lms.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.student.service.StudentLectureArchiveService;
import gd.fintech.lms.vo.LectureAndClassRegistrationAndSubject;
import gd.fintech.lms.vo.LectureArchive;

@Controller
public class StudentLectureArchiveController {
	@Autowired StudentLectureArchiveService studentLectureArchiveService;
	
	// 강좌 자료식 목록
	@GetMapping("auth/student/lecture/{lectureNo}/archive/archiveList/{currentPage}")
	public String archiveList(Model model,
			@PathVariable(name="lectureNo") int lectureNo,
			@PathVariable(name="currentPage") int currentPage) {
		
		int rowPerPage = 10; // 한페이지에 출력할 개수
		int totalCount = studentLectureArchiveService.selectLectureArchiveCount(lectureNo); // 마지막 페이지
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
		
		// 자료실 목록 가져오기
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		map.put("lectureNo", lectureNo);
		List<LectureArchive> archiveList = studentLectureArchiveService.selectLectureArchiveListByPage(map);

		
		int navPerPage = 10; // 네비에 출력될 페이지 개수
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1; // 네비의 첫 페이지 
		int navLastPage = navFirstPage + navPerPage - 1; // 네비의 마지막 페이지
		
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
		if (nextPage > lastPage) {
			nextPage = lastPage;
		}

		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		model.addAttribute("archiveList", archiveList);
		return "/auth/student/lecture/archive/archiveList";
	}
	
	// 강좌 자료실 상세보기
	@GetMapping("auth/student/lecture/{lectureNo}/archive/archiveOne/{lectureArchiveNo}")
	public String archiveOne(Model model,
			@PathVariable(name="lectureNo") int lectureNo,
			@PathVariable(name="lectureArchiveNo") int lectureArchiveNo) {
		System.out.println(lectureArchiveNo);
		LectureArchive archive = studentLectureArchiveService.selectLectureArchiveOne(lectureArchiveNo);
		
		model.addAttribute("archive", archive);
		return "/auth/student/lecture/archive/archiveOne";
	}
	
}
