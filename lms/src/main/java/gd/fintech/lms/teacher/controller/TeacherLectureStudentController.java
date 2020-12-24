package gd.fintech.lms.teacher.controller;

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

import gd.fintech.lms.teacher.service.TeacherLectureStudentService;
import gd.fintech.lms.vo.LectureAndStudentAndClassRegistration;
import gd.fintech.lms.vo.Student;

@Controller
public class TeacherLectureStudentController {
	@Autowired TeacherLectureStudentService teacherLectureStudentService;
	
	// 강의를 듣는 학생 리스트
	@GetMapping("/auth/teacher/lecture/{lectureNo}/student/studentList/{currentPage}")
	public String studentList(Model model,
			ServletRequest request,
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "currentPage") int currentPage) {
		
		//세션에서 강사의 이름을 가져오기
		HttpSession session =  ((HttpServletRequest)request).getSession();
		String teacherName = (String)session.getAttribute("loginName");
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("teacherName", teacherName);
		map2.put("lectureNo", lectureNo);
		
		int rowPerPage = 10; // 한페이지에 출력할 개수
		int totalCount = teacherLectureStudentService.getTeacherLectureStudentCount(map2);
		System.out.println(totalCount + "총 갯수");
		int beginRow = (currentPage - 1) * rowPerPage; // 시작 페이지

		// 마지막 페이지 구하기
		int lastPage = 0;
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		} else {
			lastPage = totalCount / rowPerPage + 1;			
		}

		// 전체 페이지가 0개이면 현재 페이지도 0으로 표시
		if (lastPage == 0) {
			currentPage = 0;
		}
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		map.put("teacherName",teacherName);
		map.put("lectureNo", lectureNo);
		
		List<LectureAndStudentAndClassRegistration> LASACR = teacherLectureStudentService.selectTeacherLecutreStudentListByPage(map);
		
		int navPerPage = 10; // 네비에 출력될 페이지 개수
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1; // 네비의 첫 페이지 
		int navLastPage = navFirstPage + navPerPage - 1; // 네비의 마지막 페이지
		
		// 현재 페이지가 10으로 나누어 떨어질 때
		if (currentPage % navPerPage == 0 && currentPage != 0) {
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
	
		// 현재 페이지에 대한 이전 페이지
		int prePage;
		if (currentPage > 10) {
			prePage = currentPage - (currentPage % navPerPage) + 1 - 10;
		} else {
			prePage = 1;
		}

		// 현재 페이지에 대한 다음 페이지
		int nextPage = currentPage - (currentPage % navPerPage) + 1 + 10;
		if (nextPage > lastPage) {
			nextPage = lastPage;
		}
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);

		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);

		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		model.addAttribute("LASACR",LASACR);
		
		return "/auth/teacher/lecture/student/studentList";
	}
	
	// 강의를 듣는 학생의 개인정보
	@GetMapping("/auth/teacher/lecture/{lectureNo}/student/studentOne/{studentId}")
	public String teacherLectureStudentOne(Model model,
			ServletRequest request,
			@PathVariable(name = "lectureNo") int lectureNo,
			@PathVariable(name = "studentId") String studentId) {
		
		//세션에서 강사의 이름을 가져오기
		HttpSession session =  ((HttpServletRequest)request).getSession();
		String teacherName = (String)session.getAttribute("loginName");
		
		Map<String, Object> map = new HashMap<>();
		map.put("lectureNo",lectureNo);
		map.put("teacherName", teacherName);
		map.put("studentId", studentId);
		
		
		LectureAndStudentAndClassRegistration LASACR = teacherLectureStudentService.getStudentOne(map);
		
		model.addAttribute("lectureNo",lectureNo);
		model.addAttribute("studentId", studentId);
		model.addAttribute("teacherName", teacherName);
		model.addAttribute("LASACR", LASACR);
		
		return "/auth/teacher/lecture/student/studentOne";
	}
	
}
