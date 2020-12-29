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

import gd.fintech.lms.student.service.StudentTestService;
import gd.fintech.lms.vo.Multiplechoice;
import gd.fintech.lms.vo.Test;

@Controller
public class StudentTestController {
	@Autowired StudentTestService studentTestService;
	
	// 평가 목록
	@GetMapping("auth/student/lecture/{lectureNo}/test/testList")
	public String testList(Model model, ServletRequest request, 
			@PathVariable(name="lectureNo") int lectureNo) {

		HttpSession session = ((HttpServletRequest)request).getSession();	
		String accountId = (String)session.getAttribute("loginId");		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);
		map.put("accountId", accountId);
		// 평가 목록 가져오기
		Test test = studentTestService.selectTestListByPage(map);
		
		model.addAttribute("test", test);
		
		return "/auth/student/lecture/test/testList";
	}
	
	// 평가 상세보기
	@GetMapping("auth/student/lecture/{lectureNo}/test/testOne/{currentPage}")
	public String testOne(Model model,  ServletRequest request,
			@PathVariable(name="lectureNo") int lectureNo,
			@PathVariable(name="currentPage") int currentPage) {

		// 세션에서 아이디 가져오기
		HttpSession session = ((HttpServletRequest)request).getSession();	
		String accountId = (String)session.getAttribute("loginId");
		
		int rowPerPage = 5;
		int totalCount = studentTestService.selectMultiplechoiceCount(lectureNo) / 5;		
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
		map.put("accountId", accountId);
		map.put("lectureNo", lectureNo);
		
		List<Multiplechoice> multiplechoice = studentTestService.selectTestOne(map);
		
		model.addAttribute("multiplechoice", multiplechoice);
		model.addAttribute("lastPage", lastPage);
		return "/auth/student/lecture/test/testOne"; 
	}
}
