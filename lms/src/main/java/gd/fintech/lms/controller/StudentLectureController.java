package gd.fintech.lms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.service.StudentLectureService;
import gd.fintech.lms.vo.LectureAndClassRegistration;

// 학생 강좌 컨트롤러
@Controller
public class StudentLectureController {
	@Autowired StudentLectureService studentLectureService;
	
	// 학생 인덱스
	@GetMapping("/auth/student/index/{studentId}/{currentPage}")
	public String index(Model model,
			@PathVariable(name="studentId") String studentId,
			@PathVariable(name="currentPage") int currentPage) {
		int rowPerPage = 10;
		//int endPage = 0;
		
		// 강좌 목록
		Map<String, Object> map = new HashMap<>();
		map.put("studentId", studentId);
		map.put("beginRow", 0);
		map.put("rowPerPage", rowPerPage);
		List<LectureAndClassRegistration> lectureList = studentLectureService.selectStudentClassListByPage(map);
		
		model.addAttribute("lectureList", lectureList);
		return "auth/student/index";
	}
}
