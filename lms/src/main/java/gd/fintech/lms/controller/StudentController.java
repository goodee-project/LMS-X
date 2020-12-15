package gd.fintech.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.service.StudentService;
import gd.fintech.lms.vo.Student;

@Controller
public class StudentController {
	@Autowired private StudentService studentService;
	
	@GetMapping("/studentList")
	public String boardList(Model model) {
		List<Student> studentList = studentService.getStudentList();
		model.addAttribute("studentList", studentList);
		return "studentList";
	}
}
