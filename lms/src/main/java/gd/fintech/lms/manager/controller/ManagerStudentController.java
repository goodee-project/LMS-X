package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.manager.service.ManagerStudentService;
import gd.fintech.lms.vo.Student;

@Controller
public class ManagerStudentController {
	@Autowired private ManagerStudentService managerStudentService;
	
	@GetMapping("/auth/manager/studentList")
	public String studentList(Model model) {
		List<Student> studentList = managerStudentService.getStudentList();
		model.addAttribute("studentList", studentList);
		return "auth/manager/studentList";
	}
}
