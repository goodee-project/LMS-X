package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

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
	
	@GetMapping("/auth/manager/subject/insertSubject")
	public String insertSubject() {
		return "auth/manager/subject/insertSubject";
	}
	
	@PostMapping("/auth/manager/subject/insertSubject")
	public String insertSubject(Subject subject) {
		managerSubjectService.insertSubject(subject);
		return "redirect:/auth/manager/subject/subjectList";
	}
	
	@GetMapping("/auth/manager/subject/deleteSubject")
	public String deleteSubject(int subjectNo) {
		managerSubjectService.deleteSubject(subjectNo);
		return "redirect:/auth/manager/subject/subjectList";
	}
	
	@GetMapping("/auth/manager/subject/updateSubject/{subjectNo}")
	public String updateSubject(Model model,
		@PathVariable(name="subjectNo") int subjectNo) {
		Subject subjectOne = managerSubjectService.subjectOne(subjectNo);
		model.addAttribute("subject", subjectOne);
		return "auth/manager/subject/updateSubject";
	}
	
	@PostMapping("/auth/manager/subject/updateSubject")
	public String updateSubject(Subject subject) {
		managerSubjectService.updateSubject(subject);
		return "redirect:/auth/manager/subject/subjectList";
	}
	
	@GetMapping("/auth/manager/subject/subjectOne/{subjectNo}")
	public String subjectOne(Model model,
		@PathVariable(name = "subjectNo") int subjectNo) {
		model.addAttribute("subject", managerSubjectService.subjectOne(subjectNo));
		return "auth/manager/subject/subjectOne";
	}
}
