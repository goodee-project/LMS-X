package gd.fintech.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.service.ManagerQuestionService;
import gd.fintech.lms.vo.Question;

@Controller
public class ManagerQuestionController {
	@Autowired private ManagerQuestionService managerQuestionService;
	
	@GetMapping("/auth/manager/questionList")
	public String questionList(Model model) {
		List<Question> questionList = managerQuestionService.getQuestionList();
		model.addAttribute("questionList", questionList);
		return "auth/manager/questionList";
	}
}
