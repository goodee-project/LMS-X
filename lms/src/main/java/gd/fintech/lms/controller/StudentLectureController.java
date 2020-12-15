package gd.fintech.lms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.service.StudentLectureService;
import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.LectureAndClassRegistrationAndSubjectAndTextbookAndClassroom;

@Controller
public class StudentLectureController {
	@Autowired StudentLectureService studentLectureService;
	
	// 학생 수강 상세보기
	@GetMapping("auth/student/classOne/{classRegistrationNo}")
	public String classOne(Model model,
			@PathVariable(name="classRegistrationNo") int classRegistrationNo) {
		LectureAndClassRegistrationAndSubjectAndTextbookAndClassroom lcstc = studentLectureService.selectStudentClassOne(classRegistrationNo);
		
		model.addAttribute("lcstc", lcstc);
		return "/auth/student/class/classOne";
	}
	
	// 학생이 수강하는 강의의 후기를 수정하는 액션
	@PostMapping("auth/student/updateClassReview")
	public String updateClassReview(ClassRegistration classRegistration) {
		studentLectureService.updateStudentClassReview(classRegistration);
		return "redirect:/auth/student/classOne/" + classRegistration.getClassRegistrationNo();
	}
}
