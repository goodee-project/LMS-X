package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.manager.service.ManagerQuestionService;
import gd.fintech.lms.vo.Question;

@Controller
public class ManagerQuestionController {
	@Autowired private ManagerQuestionService managerQuestionService;
	
	@GetMapping("/auth/manager/question/questionList")
	public String questionList(Model model) {
		List<Question> questionList = managerQuestionService.getQuestionList();
		model.addAttribute("questionList", questionList);
		return "auth/manager/question/questionList";
	}
	
	@GetMapping("/auth/manager/question/deleteQuestion/{questionNo}")
	public String deleteQuestion(
		@PathVariable(name = "questionNo") int questionNo) {
		managerQuestionService.deleteQuestion(questionNo);
		return "redirect:/auth/manager/question/questionList";
	}
	
	@GetMapping("/auth/manager/question/questionOne/{questionNo}")
	public String questionOne(Model model,
		@PathVariable(name = "questionNo") int questionNo) {
		model.addAttribute("question", managerQuestionService.getQuestionOne(questionNo));
		return "auth/manager/question/questionOne";
	}
}
