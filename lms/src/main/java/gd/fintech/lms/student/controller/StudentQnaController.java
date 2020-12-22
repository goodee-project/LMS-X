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
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.student.service.StudentQnaCommentService;
import gd.fintech.lms.student.service.StudentQnaService;
import gd.fintech.lms.vo.Question;
import gd.fintech.lms.vo.QuestionComment;
import gd.fintech.lms.vo.QuestionForm;

@Controller
public class StudentQnaController {
	// Autowired annotation 사용
	@Autowired private StudentQnaService studentQnaService;
	@Autowired private StudentQnaCommentService studentQnaCommentService;
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
	
	// Qna 상세보기
	@GetMapping("/auth/student/lecture/{lectureNo}/qna/qnaOne/{questionNo}")
	public String qnaOne(Model model, ServletRequest request,
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "questionNo") int questionNo) {
		
		HttpSession session = ((HttpServletRequest)request).getSession();
		String accountId = (String)session.getAttribute("loginId");
		
		studentQnaService.updateStudentQnaCountUp(questionNo);

		// Map
		Map<String, Object> map = new HashMap<>();
		map.put("lectureNo", lectureNo);
		map.put("questionNo", questionNo);

		List<QuestionComment> questionComment = studentQnaCommentService.getQnaCommentListByPage(map);
		Question question = studentQnaService.getStudentQnaOne(questionNo);
				
		model.addAttribute("lectrueNo", lectureNo);
		model.addAttribute("question", question);
		model.addAttribute("questionComment",questionComment);
		model.addAttribute("accountId", accountId);
		return "/auth/student/lecture/qna/qnaOne";
	}
	
	// Qna 작성 폼
	@GetMapping("/auth/student/lecture/{lectureNo}/qna/insertQna")
	public String insertQna(Model model,
			@PathVariable(name = "lectureNo") int lectureNo) {
		
		model.addAttribute("lectureNo", lectureNo);
		return "/auth/student/lecture/qna/insertQna";
	}
	
	// Qna 작성 액션
	@PostMapping("/auth/student/lecture/{lectureNo}/qna/insertQna")
	public String insertQna(QuestionForm questionForm, ServletRequest request,
			@PathVariable(name = "lectureNo") int lectureNo) {
		
		System.out.println("questionForm" + questionForm);
		// 세션에서 아이디 가져오기
		HttpSession session = ((HttpServletRequest)request).getSession();
		String accountId = (String)session.getAttribute("loginId");
		String loginName = (String)session.getAttribute("loginName");
		
		questionForm.setAccountId(accountId);
		questionForm.setQuestionWriter(loginName);
		
		studentQnaService.insertQuestion(questionForm);
		
		return "redirect:/auth/student/lecture/" + lectureNo + "/qna/qnaList/1";
		
	}
	
	// Qna 수정 폼
	@GetMapping("/auth/student/lecture/{lectureNo}/qna/updateQna/{questionNo}")
	public String updateQna(Model model,
			@PathVariable(name = "questionNo") int questionNo,
			@PathVariable(name = "lectureNo") int lectureNo) {
		
		Question question = studentQnaService.getStudentQnaOne(questionNo);
		
		// Map 안에 강좌번호 넣기
		Map<String, Object> map = new HashMap<>();
		map.put("lectureNo", lectureNo);
		
		model.addAttribute("lectrueNo", lectureNo);
		model.addAttribute("question", question);
		System.out.println("폼questionNo" + question.getQuestionNo());
		
		return "/auth/student/lecture/qna/updateQna";
	}
	
	// Qna 수정 액션
	@PostMapping("/auth/student/lecture/{lectureNo}/qna/updateQna/{questionNo}")
	public String updateQna(Model model, QuestionForm questionForm,
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "questionNo") int questionNo) {
		
		questionForm.setQuestionNo(questionNo);
		studentQnaService.updateStudentQna(questionForm);
		
		model.addAttribute("lectureNo", lectureNo);
		model.addAttribute("questionNo", questionNo);
		
		System.out.println("액션questionNo" + questionNo);
		
		return "redirect:/auth/student/lecture/" + lectureNo + "/qna/qnaOne/" + questionNo;
	}
	
	// Qna 삭제
	@GetMapping("/auth/student/lecture/{lectureNo}/qna/deleteQuestion/{questionNo}")
	public String deleteQuestion(
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "questionNo") int questionNo) {
		studentQnaService.deleteStudentQnaByQnaNo(questionNo);
		
		return "redirect:/auth/student/lecture/" + lectureNo + "/qna/qnaList/1";
	}
	
}
