package gd.fintech.lms.student.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.student.service.StudentSyllabusService;
import gd.fintech.lms.vo.Syllabus;

//학생: 강의계획서 컨트롤러
@Controller
public class StudentSyllabusController {
	@Autowired StudentSyllabusService studentSyllabusService;
	
	//강의 계획서 페이지
	@GetMapping("/auth/student/lecture/syllabus/syllabus/{lectureNo}")
	public String StudentSyllabus(Model model, @PathVariable(value = "lectureNo") int lectureNo) {
		Syllabus studentSyllabus = studentSyllabusService.getStudentSyllabus(lectureNo);
		
		model.addAttribute("studentSyllabus", studentSyllabus);
		return "/auth/student/lecture/syllabus/syllabus";
	}
}
