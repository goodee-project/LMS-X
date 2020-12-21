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
	
	// 강의계획서 조회
	@GetMapping("/auth/teacher/lecture/{lectureNo}/syllabus/syllabusOne")
	public String syllabusOne(Model model,
			@PathVariable(value = "lectureNo") int lectureNo) {		// 강좌 고유번호
		Syllabus syllabus = teacherSyllabusService.selectSyllabusOne(lectureNo);
		
		// [Logger] 강의계획서(syllabus)
		logger.trace("syllabus[" + syllabus + "]");
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("syllabus", syllabus);
		
		// [View] /auth/teacher/lecture/syllabus/syllabusOne.jsp
		return "/auth/teacher/lecture/syllabus/syllabusOne";
	}
	
	// 강의계획서 첨부 Form
	@GetMapping("/auth/teacher/lecture/{lectureNo}/syllabus/insertSyllabus")
	public String insertSyllabus() {
		// [View] /auth/teacher/lecture/syllabus/insertSyllabus.jsp
		return "/auth/teacher/lecture/syllabus/insertSyllabus";
	}
	
	// 강의계획서 첨부 Action
	@PostMapping("/auth/teacher/lecture/{lectureNo}/syllabus/insertSyllabus")
	public String insertSyllabus(SyllabusForm syllabusForm) {
		// [Logger] 강의계획서 Form(syllabusForm)
		logger.trace("syllabusForm[" + syllabusForm + "]");
		
		teacherSyllabusService.insertTeacherSyllabus(syllabusForm);
		
		// [Redirect] 강의계획서 첨부파일을 업로드 후 강의계획서 조회 페이지로 이동
		return "redirect:/auth/teacher/lecture/" + syllabusForm.getLectureNo() + "/syllabus/syllabusOne";
	}
}
