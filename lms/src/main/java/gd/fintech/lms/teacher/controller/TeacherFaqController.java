package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.lms.teacher.service.TeacherFaqService;
import gd.fintech.lms.vo.Faq;

@Controller
public class TeacherFaqController {
	@Autowired TeacherFaqService teacherFaqService;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// FAQ 목록
	@GetMapping("/auth/teacher/faq/faqList/{currentPage}")
	public String faqList(Model model, 
			@PathVariable(value = "currentPage") int currentPage, 
			@RequestParam(value=  "searchCategory", defaultValue = "") String searchCategory,  			// FAQ 카테고리
			@RequestParam(value=  "searchOption", defaultValue = "titleContent") String searchOption, 	// 제목 + 내용, 제목, 내용
			@RequestParam(value=  "searchText", defaultValue = "") String searchText) {					// 문자열 검색
		// 한 페이지에 표시할 데이터 수
		int rowPerPage = 10;
		
		// 시작 페이지 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		
		// [Logger] 데이터베이스로부터 FAQ 목록을 가져온다
		List<Faq> faqList = teacherFaqService.selectTeacherFaqListByPage(beginRow, rowPerPage, searchCategory, searchOption, searchText);
		logger.trace("faqList[" + faqList + "]");
		
		// 페이징 코드
		// 전체 데이터 수
		int totalCount = teacherFaqService.selectTeacherFaqCount(searchCategory, searchOption, searchText);
		
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
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("faqList", faqList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		model.addAttribute("searchCategory", searchCategory);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchText", searchText);
		
		// [View] /auth/teacher/faq/faqList.jsp
		return "/auth/teacher/faq/faqList";
	}
	
	// FAQ 조회
	@GetMapping("/auth/teacher/faq/faqOne/{faqNo}")
	public String faqOne(Model model, 
			@PathVariable(value = "faqNo") int faqNo) {
		// FAQ 조회 조회수 증가
		teacherFaqService.updateTeacherFaqCountUp(faqNo);
		
		// FAQ 조회
		Faq faq = teacherFaqService.selectTeacherFaqOne(faqNo);
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("faq", faq);
		
		// [View] /auth/teacher/faq/faqOne.jsp
		return "/auth/teacher/faq/faqOne";
	}
}
