package gd.fintech.lms.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.student.service.StudentLectureService;
import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.LectureAndClassRegistrationAndSubject;
import gd.fintech.lms.vo.LectureAndClassRegistrationAndSubjectAndTextbookAndClassroom;

@Controller
public class StudentLectureController {
	@Autowired StudentLectureService studentLectureService;
	
	// 학생 수강 상세보기
	@GetMapping("auth/student/lecture/classOne/{classRegistrationNo}")
	public String classOne(Model model,
			@PathVariable(name="classRegistrationNo") int classRegistrationNo) {
		LectureAndClassRegistrationAndSubjectAndTextbookAndClassroom lcstc = studentLectureService.selectStudentClassOne(classRegistrationNo);
		
		model.addAttribute("lcstc", lcstc);
		return "/auth/student/lecture/classOne";
	}
	
	// 학생이 수강하는 강의의 후기를 수정하는 액션
	@PostMapping("auth/student/lecture/updateClassReview")
	public String updateClassReview(ClassRegistration classRegistration) {
		studentLectureService.updateStudentClassReview(classRegistration);
		return "redirect:/auth/student/lecture/classOne/" + classRegistration.getClassRegistrationNo();
	}
	
	// 학생의 수강신청을 위한 강좌 목록
	@GetMapping("auth/student/lecture/lectureList/{currentPage}")
	public String lectureList(Model model,
			@PathVariable(name="currentPage") int currentPage) {
		int rowPerPage = 10; // 한페이지에 출력할 개수
		int endPage = studentLectureService.selectStudentLectureListEndPage(rowPerPage); // 마지막 페이지
		int beginRow = (currentPage - 1) * rowPerPage; // 시작 페이지
		
		// 강좌 목록 가져오기
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		List<Lecture> lectureList = studentLectureService.selectStudentLectureListByPage(map);

		
		int navPerPage = 10; // 네비에 출력될 페이지 개수
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1; // 네비의 첫 페이지 
		int navLastPage = navFirstPage + navPerPage - 1; // 네비의 마지막 페이지
		
		// 현재 페이지가 10으로 나누어 떨어질 때
		if (currentPage % navPerPage == 0 && currentPage != 0) {
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("lectureList", lectureList);
		return "/auth/student/lecture/lectureList";
	}
	
	// 수강 대기 상태일시 수강 취소 액션
	@PostMapping("auth/student/lecture/cancelClass/{classRegistrationNo}")
	public String cancelClass(@PathVariable(name="classRegistrationNo") int classRegistrationNo) {
		
		studentLectureService.updateClassRegistrationState(classRegistrationNo);
		return "redirect:/auth/student/lecture/classOne/" + classRegistrationNo;
	}
}
