package gd.fintech.lms.student.restcontroller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.student.restservice.StudentTestRestService;
import gd.fintech.lms.vo.Answersheet;

@RestController
public class StudentTestRestController {
	@Autowired StudentTestRestService studentTestRestService;
	
	// 이미 해당 문제의 답안을 제출 했는지
	@PostMapping("auth/student/lecture/test/selectCheckAnswersheet")
	public boolean selectCheckAnswersheet(Answersheet answersheet, ServletRequest request) {
		// 세션에서 id 가져오기		
		HttpSession session = ((HttpServletRequest)request).getSession();	
		String accountId = (String)session.getAttribute("loginId");
		
		answersheet.setAccountId(accountId);
		
		// 이미 제출 햇을시
		if(studentTestRestService.selectCheckAnswersheet(answersheet) > 0) {
			return true;
		}
		
		// 제출 안했을시
		return false;
	}
	
	// 해당 문제의 답안을 제출함
	@PostMapping("auth/student/lecture/test/insertAnswersheet")
	public void insertAnswersheet(Answersheet answersheet, ServletRequest request) {
		
		// 세션에서 id 가져오기		
		HttpSession session = ((HttpServletRequest)request).getSession();	
		String accountId = (String)session.getAttribute("loginId");
		
		answersheet.setAccountId(accountId);
		
		studentTestRestService.insertAnswersheet(answersheet);
	}
	
	// 해당 문제의 답안을 수정함
	@PostMapping("auth/student/lecture/test/updateAnswersheet")
	public void updateAnswersheet(Answersheet answersheet, ServletRequest request) {

		// 세션에서 id 가져오기		
		HttpSession session = ((HttpServletRequest)request).getSession();	
		String accountId = (String)session.getAttribute("loginId");
		
		answersheet.setAccountId(accountId);
		
		studentTestRestService.updateAnswersheet(answersheet);
	}
	
	// 문제를 다 풀었는지
	@PostMapping("auth/student/lecture/test/selectCheckTestFinish/{testNo}")
	public boolean selectCheckTestFinish(ServletRequest request,
			@PathVariable(name="testNo") int testNo) {
		// 세션에서 id 가져오기		
		HttpSession session = ((HttpServletRequest)request).getSession();	
		String accountId = (String)session.getAttribute("loginId");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("testNo", testNo);
		map.put("accountId", accountId);
		
		// 문제를 다 풀었을시
		if(studentTestRestService.selectCheckTestFinish(map) == 0) {
			return true;
		}
		
		// 문제를 다 안풀었을시
		return false;		
	}
}
