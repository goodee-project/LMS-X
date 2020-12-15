package gd.fintech.lms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.service.TeacherLectureService;
import gd.fintech.lms.vo.Lecture;

@Controller
public class TeacherLectureController {
	@Autowired TeacherLectureService teacherLectureService;
	
	// 각 강좌별 Index 페이지
	@GetMapping(value="/auth/teacher/lecture/{lectureNo}")
	public String lectureIndex(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo) {
		// 강좌 정보
		Lecture lecture = teacherLectureService.getTeacherLectureOne(lectureNo);
		
		model.addAttribute("lecture", lecture);
		
		return "/auth/teacher/lecture/lectureIndex";
	}
}