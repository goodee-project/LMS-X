package gd.fintech.lms.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.lms.student.service.StudentFaqService;
import gd.fintech.lms.vo.Faq;
import gd.fintech.lms.vo.FaqCategory;
import gd.fintech.lms.vo.LectureAndClassRegistrationAndSubject;

@Controller
public class StudentFaqController {
	@Autowired StudentFaqService studentFaqService;
	
	// FAQ 목록 
	@GetMapping("auth/student/faq/faqList/{currentPage}")
	public String faqList(Model model, 
			@PathVariable(name="currentPage") int currentPage, 
			@RequestParam(name="searchCategory", defaultValue = "") String searchCategory, 
			@RequestParam(name="searchOption", defaultValue = "") String searchOption, 
			@RequestParam(name="searchText", defaultValue = "") String searchText) {

		
		int rowPerPage = 10;	// 한 페이지당 출력 개수
		int beginRow = (currentPage - 1) * rowPerPage; // 시작 페이지
		
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		// 검색 옵션들을 받을시 map에 추가
		map.put("searchCategory", searchCategory);		
		map.put("searchOption", searchOption);			
		map.put("searchText", searchText);	

		int totalCount = studentFaqService.selectFaqListCount(map); // 게시글 총 개수
		
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
		
		// FAQ 목록 가져오기
		List<Faq> faqList = studentFaqService.selectFaqListByPage(map);
		
		// FAQ 카테고리 목록 가져오기
		List<FaqCategory> faqCategoryList = studentFaqService.selectFaqCategoryList();
		
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
		
		model.addAttribute("faqList", faqList);
		model.addAttribute("faqCategoryList", faqCategoryList);
		
		model.addAttribute("searchCategory", searchCategory);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("searchText", searchText);
		
		return "/auth/student/faq/faqList";
	}
}
