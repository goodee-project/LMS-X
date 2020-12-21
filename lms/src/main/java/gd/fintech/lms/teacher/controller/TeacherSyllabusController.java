package gd.fintech.lms.teacher.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.teacher.service.TeacherSyllabusService;
import gd.fintech.lms.vo.Syllabus;
import gd.fintech.lms.vo.SyllabusForm;

@Controller
public class TeacherSyllabusController {
	@Autowired private TeacherSyllabusService teacherSyllabusService;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//강의 계획서
	@GetMapping("/auth/teacher/lecture/{lectureNo}/syllabus/syllabusOne")
	public String syllabusOne(Model model,
			@PathVariable(value = "lectureNo") int lectureNo) {
		Syllabus syllabus = teacherSyllabusService.selectSyllabusOne(lectureNo);
		
		//model 을 통해 View에 다음과 같은 정보들을 보내온다.
		model.addAttribute("syllabus", syllabus);
		
		return "auth/teacher/lecture/syllabus/syllabusOne";
	}
	// 계획서 첨부 폼
	@GetMapping("/auth/teacher/lecture/{lectureNo}/syllabus/insertSyllabus")
	public String insertSyllabus() {
		return "auth/teacher/lecture/syllabus/insertSyllabus";
	}
	// 게획서 첨부 액션
	@PostMapping("/auth/teacher/lecture/{lectureNo}/syllabus/insertSyllabus")
	public String insertSyllabus(SyllabusForm syllabusForm) {
		teacherSyllabusService.insertTeacherSyllabus(syllabusForm);
		return "redirect:/auth/teacher/lecture/" + syllabusForm.getLectureNo() + "/syllabus/syllabusOne";
	}
}
