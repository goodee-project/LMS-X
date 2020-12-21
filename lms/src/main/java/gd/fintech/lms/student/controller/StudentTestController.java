package gd.fintech.lms.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.student.service.StudentTestService;
import gd.fintech.lms.vo.Multiplechoice;
import gd.fintech.lms.vo.Test;

@Controller
public class StudentTestController {
	@Autowired StudentTestService studentTestService;
	
	// 평가 목록
	@GetMapping("auth/student/lecture/{lectureNo}/test/testList/{currentPage}")
	public String testList(Model model,
			@PathVariable(name="lectureNo") int lectureNo,
			@PathVariable(name="currentPage") int currentPage) {
		
		int rowPerPage = 10; // 한페이지에 출력할 개수
		int totalCount = studentTestService.selectTestListCount(lectureNo); // 마지막 페이지
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
		
		// 평가 목록 가져오기
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		map.put("lectureNo", lectureNo);
		List<Test> testList = studentTestService.selectTestListByPage(map);

		
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
		
		model.addAttribute("testList", testList);
		return "/auth/student/lecture/test/testList";
	}
	
	// 평가 상세보기
	@GetMapping("auth/student/lecture/{lectureNo}/test/testOne/{testNo}/{currentPage}")
	public String testOne(Model model,
			@PathVariable(name="lectureNo") int lectureNo,
			@PathVariable(name="testNo") int testNo,
			@PathVariable(name="currentPage") int currentPage) {
		
		int rowPerPage = 1;
		int totalCount = studentTestService.selectMultiplechoiceCount(testNo) / 5;		
		int beginRow = (currentPage - 1) * rowPerPage * 5; // 시작 페이지

		// 마지막 페이지 구하기
		int lastPage = 0;
		
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		} else {
			lastPage = totalCount / rowPerPage + 1;			
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rowPerPage", rowPerPage * 5); // 한문제당 보기가 5개 있어서 5를 곱해줌
		map.put("beginRow", beginRow);
		map.put("testNo", testNo);
		
		List<Multiplechoice> multiplechoice = studentTestService.selectTestOne(map);
		
		model.addAttribute("multiplechoice", multiplechoice);
		model.addAttribute("lastPage", lastPage);
		return "/auth/student/lecture/test/testOne"; 
	}
}
