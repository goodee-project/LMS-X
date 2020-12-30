package gd.fintech.lms.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import gd.fintech.lms.manager.service.ManagerQuestionCommentService;

@Controller
public class ManagerQuestionCommentController {
	@Autowired ManagerQuestionCommentService managerQuestionCommentService;

	// 댓글 삭제
	@GetMapping("/auth/manager/lecture/{lectureNo}/question/questionOne/{questionNo}/deleteQuestionComment/{questionCommentNo}")
	public String deleteManagerQuestionComment(
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "questionNo") int questionNo,
			@PathVariable(name = "questionCommentNo") int questionCommentNo) {
		managerQuestionCommentService.deleteManagerQuestionComment(questionCommentNo);
		return "redirect:/auth/manager/lecture/" + lectureNo + "/question/questionOne/" + questionNo + "/1";
	}
}
