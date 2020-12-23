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

import gd.fintech.lms.teacher.service.TeacherLectureService;
import gd.fintech.lms.teacher.service.TeacherTestService;
import gd.fintech.lms.vo.Answersheet;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.Test;

@Controller
public class TeacherTestController {
	@Autowired TeacherLectureService teacherLectureService;
	@Autowired TeacherTestService teacherTestService;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 평가 Index
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/testIndex")
	public String testIndex(Model model, 
			@PathVariable(name = "lectureNo") int lectureNo) {		// 강좌 고유번호
		
		// [View] /auth/teacher/lecture/test/testIndex.jsp
		return "/auth/teacher/lecture/test/testIndex";
	}
	
	// 시험 정보 조회
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/testOne")
	public String testOne(Model model, 
			@PathVariable(name = "lectureNo") int lectureNo) {		// 강좌 고유번호
		// 강좌 정보
		Lecture lecture = teacherLectureService.getTeacherLectureOne(lectureNo);
		
		// [Logger] 강좌 정보(lecture)
		logger.trace("lecture[" + lecture + "]");
		
		// 시험 정보
		Test test = teacherTestService.selectTestOne(lectureNo);
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("lecture", lecture);
		model.addAttribute("test", test);
		
		// [View] /auth/teacher/lecture/test/testOne.jsp
		return "/auth/teacher/lecture/test/testOne";
	}
	
	// 시험 정보 입력 Form
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/insertTest")
	public String insertTest(
			@PathVariable(name = "lectureNo") int lectureNo) {		// 강좌 고유번호		
		// [View] /auth/teacher/lecture/test/insertTest.jsp
		return "/auth/teacher/lecture/test/insertTest";
	}
	
	// 시험 정보 입력 Action
	@PostMapping("/auth/teacher/lecture/{lectureNo}/test/insertTest")
	public String insertTest(Test test) {
		// [Logger] 평가(test)
		logger.trace("test[" + test + "]");
		
		teacherTestService.insertTest(test);
		
		return "redirect:/auth/teacher/lecture/" + test.getLectureNo() + "/test/testOne";
	}
	
	// 시험 정보 수정 Form
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/updateTest")
	public String updateTest(Model model, 
			@PathVariable(name = "lectureNo") int lectureNo) {		// 강좌 고유번호
		// 시험 정보
		Test test = teacherTestService.selectTestOne(lectureNo);
		
		// testStartdate의 String 형태를 yyyy-MM-ddThh:mm 형식으로 변환한다
		test.setTestStartdate(test.getTestStartdate().replace(" ", "T"));
		
		// testEnddate의 String 형태를 yyyy-MM-ddThh:mm 형식으로 변환한다
		test.setTestEnddate(test.getTestEnddate().replace(" ", "T"));
		
		// [Logger] 평가(test)
		logger.trace("test[" + test + "]");
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("test", test);
		
		// [View] /auth/teacher/lecture/test/updateTest.jsp
		return "/auth/teacher/lecture/test/updateTest";
	}
	
	// 시험 정보 수정 Action
	@PostMapping("/auth/teacher/lecture/{lectureNo}/test/updateTest")
	public String updateTest(Test test) {
		// [Logger] 평가(test)
		logger.trace("test[" + test + "]");
		
		teacherTestService.updateTest(test);
		
		return "redirect:/auth/teacher/lecture/" + test.getLectureNo() + "/test/testOne";
	}
	
	// 평가 문제 목록
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/testList")
	public String testList(Model model, 
			@PathVariable(name = "lectureNo") int lectureNo) { 		// 강좌 고유번호
		
		// [View] /auth/teacher/lecture/test/testList.jsp
		return "/auth/teacher/lecture/test/testList";
	}
	
	// 평가 답안지 학생 목록
	@GetMapping("/auth/teacher/lecture/{lectureNo}/test/answersheetList")
	public String answersheetList(Model model, 
			@PathVariable(name = "lectureNo") int lectureNo) { 		// 강좌 고유번호
		
		List<Answersheet> answersheetList = teacherTestService.selectAnswersheetList(lectureNo);
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("answersheetList", answersheetList);
		
		// [View] /auth/teacher/lecture/test/answersheetList.jsp
		return "/auth/teacher/lecture/test/answersheetList";
	}
}
