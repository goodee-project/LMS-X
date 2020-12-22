package gd.fintech.lms.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
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
import gd.fintech.lms.vo.QuestionComment;

@Controller
public class StudentCommentController {
	@Autowired private StudentQnaCommentService studentQnaCommentService;
	
	// 댓글 리스트 페이징
	@GetMapping("/auth/student/lecutre/{lectureNo}/qna/qnaOne/{questionNo}/{currentPage}")
	public String studentQuestionCommentList(Model model,
			@PathVariable(name = "currentPage", required = true) int currentPage,
			@PathVariable(name = "lectureNo", required = true) int lectureNo,
			@PathVariable(name = "questionNo", required = true) int questionNo) {
		
		// 한 페이지에 출력할 게시물의 수
		int rowPerPage = 10;
		
		// 전체 데이터(댓글)의 수
		int totalCount = studentQnaCommentService.getCountQnaCommentList();
		
		// 시작 페이지
		int beginRow = (currentPage - 1) * rowPerPage;
		
		// 마지막 페이지
		int lastPage = 0;
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		} else {
			lastPage = totalCount / rowPerPage + 1;			
		}
		
		// 게시글 내 댓글 리스트 가져오기
		Map<String, Object> map = new HashMap<>();
		map.put("lectureNo", lectureNo);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		List<QuestionComment> questionComment = studentQnaCommentService.getQnaCommentListByPage(map);
		
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
		
		model.addAttribute("questionComment", questionComment);
		model.addAttribute("questionNo", questionNo);
		model.addAttribute("lectureNo", lectureNo);
		return "/auth/student/lecture/qna/qnaOne";
	}
	
	
	// 댓글 작성 
	@PostMapping("/auth/student/lecture/{lectureNo}/qna/qnaOne/{questionNo}/insertStduentQuestionComment")
	public String insertStduentQuestionComment(QuestionComment questionComment,
			ServletRequest request,
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "questionNo") int questionNo) {
		
		HttpSession session = ((HttpServletRequest)request).getSession();
		String accountId = (String)session.getAttribute("loginId");
		String loginName = (String)session.getAttribute("loginName");
		
		questionComment.setAccountId(accountId);
		questionComment.setQuestionCommentWriter(loginName);
		
		studentQnaCommentService.insertQnaComment(questionComment);
		
		return "redirect:/auth/student/lecture/" + lectureNo + "/qna/qnaOne/ " + questionNo;
	}
	
	// 댓글 수정
	@PostMapping("/auth/student/lecture/{lectureNo}/qna/qnaOne/{questionNo}/updateStduentQuestionComment")
	public String updateStduentQuestionComment(QuestionComment questionComment,
			ServletRequest request,
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "questionNo") int questionNo) {
		

		studentQnaCommentService.updateQnaComment(questionComment);
		
		return "redirect:/auth/student/lecture/" + lectureNo + "/qna/qnaOne/ " + questionNo;
	}
	// 댓글 삭제
	@GetMapping("/auth/student/lecture/{lectureNo}/qna/qnaOne/{questionNo}/deleteQuestionComment/{questionCommentNo}")
	public String deleteQuestionComment(Model model,
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "questionNo") int questionNo,
			@PathVariable(name = "questionCommentNo") int questionCommentNo) {
		
		studentQnaCommentService.deleteQnaComment(questionCommentNo);
		
		return "redirect:/auth/student/lecture/" + lectureNo + "/qna/qnaOne/ " + questionNo;
	}
	
}
