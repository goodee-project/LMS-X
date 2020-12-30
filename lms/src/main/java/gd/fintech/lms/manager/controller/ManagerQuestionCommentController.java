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
	@GetMapping("/auth/manager/question/questionOne/{questionNo}/deleteQuestionComment/{questionCommentNo}")
	public String deleteManagerQuestionComment(
			@PathVariable(value = "questionNo") int questionNo,
			@PathVariable(value = "questionCommentNo") int questionCommentNo) {
		managerQuestionCommentService.deleteManagerQuestionComment(questionCommentNo);
		return "redirect:/auth/teacher/question/questionOne/" + questionNo + "/1";
	}
}
