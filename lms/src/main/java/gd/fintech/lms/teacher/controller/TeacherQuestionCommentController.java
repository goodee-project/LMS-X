package gd.fintech.lms.teacher.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.teacher.service.TeacherQuestionCommentService;
import gd.fintech.lms.teacher.service.TeacherQuestionService;
import gd.fintech.lms.vo.QuestionComment;

@Controller
public class TeacherQuestionCommentController {
	@Autowired TeacherQuestionCommentService teacherQuestionCommentService;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	// 댓글 추가
	@PostMapping("/auth/teacher/lecture/{lectureNo}/question/questionOne/{questionNo}/insertTeacherQuestionComment")
	public String insertTeacherQuestionComment(QuestionComment questionComment,
			ServletRequest request,
			@PathVariable(value = "lectureNo") int lectureNo,
			@PathVariable(value = "questionNo") int questionNo) {
		
		// 세션에서 계정 아이디를 받아옴
		HttpSession session = ((HttpServletRequest)request).getSession();
		String accountId = (String)session.getAttribute("loginId");
		String loginName = (String)session.getAttribute("loginName");
		
		questionComment.setAccountId(accountId);
		questionComment.setQuestionCommentWriter(loginName);
		
		teacherQuestionCommentService.insertTeacherQuestionComment(questionComment);
		
		return "redirect:/auth/teacher/lecture/" + lectureNo + "/question/questionOne/" + questionNo + "/1";
	}
	
	// 댓글 삭제
	@GetMapping("/auth/teacher/lecture/{lectureNo}/question/questionOne/{questionNo}/deleteQuestionComment/{questionCommentNo}")
	public String deleteQuestionComment(@PathVariable(value = "lectureNo") int lectureNo,
			@PathVariable(value = "questionNo") int questionNo,
			@PathVariable(value = "questionCommentNo") int questionCommentNo) {
		teacherQuestionCommentService.deleteTeacherQuestionComment(questionCommentNo);
		return "redirect:/auth/teacher/lecture/" + lectureNo + "/question/questionOne/" + questionNo + "/1";
	}
	
	// 댓글 수정 Form
	@GetMapping("/auth/teacher/lecture/{lectureNo}/question/questionOne/{questionNo}/updateQuestionComment/{questionCommentNo}")
	public String updateQuestionComment(Model model, @PathVariable(value = "lectureNo") int lectureNo,
			@PathVariable( value = "questionNo") int questionNo,
			@PathVariable( value = "questionCommentNo") int questionCommentNo) {
		QuestionComment questionComment = teacherQuestionCommentService.getTeacherQuestionCommentOne(questionCommentNo);
		
		// [Logger] 댓글 상세보기(questionComment)
		logger.trace("questionComment [" + questionComment + "]");
		
		// model을 통해 View에 다음과 같은 정보를 보내준다.
		model.addAttribute("questionComment", questionComment);
		
		return "/auth/teacher/lecture/question/updateQuestionComment";
	}
	
	// 댓글 수정 액션
	@PostMapping("/auth/teacher/lecture/{lectureNo}/question/questionOne/{questionNo}/updateQuestionComment/{questionCommentNo}")
	public String updateQuestionComment(QuestionComment questionComment,
			@PathVariable(value = "lectureNo") int lectureNo,
			@PathVariable(value = "questionNo") int questionNo) {
		teacherQuestionCommentService.updateTeacherQuestionComment(questionComment);
		
		// [Redirect] 댓글 입력 후 질문 상세보기 페이지로 이동
		return "redirect:/auth/teacher/lecture/" + lectureNo + "/question/questionOne/" + questionNo + "/1";
	}
}
