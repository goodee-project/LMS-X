package gd.fintech.lms.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.student.service.StudentQnaService;
import gd.fintech.lms.vo.Question;

@Controller
public class StudentQnaController {
	// Autowired annotation 사용
	@Autowired private StudentQnaService studentQnaService;
	//auth/student/lecture/qna/qnaList
	// Qna 리스트 페이징
	@GetMapping("/auth/student/lecture/{lectureNo}/qna/qnaList/{currentPage}")
	public String qnaList(Model model,
			@PathVariable(name = "currentPage", required = true) int currentPage,
			@PathVariable(name = "lectureNo", required = true) int lectureNo) {
		// 한 페이지에 출력할 게시물의 수
		int rowPerPage = 10;
		// 전체 데이터(게시글)의 수
		int totalCount = studentQnaService.getCountStudentQnaList();
		// 시작 페이지
		int beginRow = (currentPage - 1) * rowPerPage;
		
		// 마지막 페이지 구하기
		int lastPage = 0;
		if(totalCount % rowPerPage == 0) {
				lastPage = totalCount / rowPerPage;
		} else {
				lastPage = totalCount / rowPerPage + 1;			
		}
		
		// 질문게시판 게시글 리스트 가져오기
		Map<String, Object> map = new HashMap<>();
		map.put("lectureNo", lectureNo);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		List<Question> question = studentQnaService.getStudenQnaListByPage(map);
		
		// 네비에 출력될 페이지 개수
		int navPerPage = 10; 
		// 네비의 첫 페이지
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;
		// 네비의 마지막 페이지
		int navLastPage = navFirstPage + navPerPage - 1; 
		
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
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		model.addAttribute("question", question);
		model.addAttribute("lectureNo", lectureNo);
		
		return "/auth/student/lecture/qna/qnaList";
	}
	
	//Qna 상세보기
	@GetMapping("/auth/student/lecture/{lectureNo}/qna/qnaOne/{questionNo}")
	public String qnaOne(Model model,
			@PathVariable(value = "lectureNo") int lectureNo,
			@PathVariable(value = "questionNo") int questionNo) {
		Question question = studentQnaService.getStudentQnaOne(questionNo);
		
		// Map 안에 강좌번호 넣기
		Map<String, Object> map = new HashMap<>();
		map.put("lectureNo", lectureNo);
		
		model.addAttribute("lectrueNo", lectureNo);
		model.addAttribute("question", question);
		
		return "/auth/student/lecture/qna/qnaOne";
	}
	
}
