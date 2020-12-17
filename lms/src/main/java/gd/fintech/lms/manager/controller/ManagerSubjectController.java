package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.manager.service.ManagerSubjectService;
import gd.fintech.lms.vo.Subject;

@Controller
public class ManagerSubjectController {
	@Autowired private ManagerSubjectService managerSubjectService;
	
	@GetMapping("/auth/manager/subject/subjectList")
	public String subjectList(Model model) {
		List<Subject> subjectList = managerSubjectService.getSubjectList();
		model.addAttribute("subjectList", subjectList);
		return "auth/manager/subject/subjectList";
	}
}
