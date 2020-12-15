package gd.fintech.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.service.StudentManagementService;
import gd.fintech.lms.vo.Student;

@Controller
public class StudentManagementController {
	@Autowired private StudentManagementService studentManagementService;
	
	@GetMapping("/auth/manager/studentList")
	public String studentList(Model model) {
		List<Student> studentList = studentManagementService.getStudentList();
		model.addAttribute("studentList", studentList);
		return "auth/manager/studentList";
	}
}
