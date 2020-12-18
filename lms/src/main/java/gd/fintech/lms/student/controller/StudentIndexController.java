package gd.fintech.lms.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.student.service.StudentLectureService;
import gd.fintech.lms.vo.LectureAndClassRegistrationAndSubject;

// 학생 강좌 컨트롤러
@Controller
public class StudentIndexController {
	@Autowired StudentLectureService studentLectureService;
	
	// 학생 인덱스
	@GetMapping("/auth/student/index/{currentPage}")
	public String index(Model model,ServletRequest request, 
			@PathVariable(name="currentPage") int currentPage) {
		HttpSession session = ((HttpServletRequest)request).getSession();
		
		String studentId = (String)session.getAttribute("loginId");
		
		int rowPerPage = 10; // 한페이지에 출력할 개수
		int totalCount = studentLectureService.selectStudentClassListEndPage(studentId); // 마지막 페이지
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
		
		// 강좌 목록 가져오기
		Map<String, Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		List<LectureAndClassRegistrationAndSubject> lectureList = studentLectureService.selectStudentClassListByPage(map);

		
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

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		model.addAttribute("lectureList", lectureList);
		return "/auth/student/index";
	}
}
