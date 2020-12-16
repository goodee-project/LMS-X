package gd.fintech.lms.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.manager.service.ManagerAccountService;
import gd.fintech.lms.manager.service.ManagerClassroomService;
import gd.fintech.lms.manager.service.ManagerLectureService;
import gd.fintech.lms.manager.service.ManagerSubjectService;
import gd.fintech.lms.manager.service.ManagerTextbookService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Classroom;
import gd.fintech.lms.vo.Lecture;
import gd.fintech.lms.vo.LectureAndClassAndTextbook;
import gd.fintech.lms.vo.Subject;
import gd.fintech.lms.vo.Textbook;

@Controller
public class ManagerLectureController {
	@Autowired private ManagerLectureService managerLectureService;
	// 강사 계정 리스트 출력을 위한 AutoWired
	@Autowired private ManagerAccountService managerAccountService;
	// 과목 리스트 출력을 위한 AutoWired
	@Autowired private ManagerSubjectService managerSubjectService;
	// 교재 리스트 출력을 위한 AutoWired
	@Autowired private ManagerTextbookService managertextbookService;
	// 강의실 리스트 출력을 위한 AutoWired
	@Autowired private ManagerClassroomService managerClassroomService;
	//운영자가 추가한 강의 목록 리스트
	@GetMapping("/auth/manager/lectureList/{currentPage}")
	public String lectureList(Model model,
			@PathVariable(name = "currentPage") int currentPage) {
		int rowPerPage = 10; //한 페이지에 출력할 개수
		int endPage = managerLectureService.getCountLecture(rowPerPage);//마지막 페이지
		int beginRow = (currentPage - 1) * rowPerPage; 					// 시작 페이지
		// 강의 목록 출력
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		// 강의 목록
		List<Lecture> lectureList = managerLectureService.getLectureListByPage(map);
		
		int navPerPage = 10; 											// 네비에 출력할 페이지 개수
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;// 네비의 첫번째 페이지
		int navLastPage = navFirstPage + navPerPage - 1; 				// 네비의 마지막 페이지
		//현재 페이지가 10으로 나누어 떨어질 때
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
		
		return "auth/manager/lectureList";
	}
	// 강의 개설 액션 
	@PostMapping("/auth/manager/insertLecture")
	public String insertLecture(Lecture lecture) { // 커맨트 객체
		managerLectureService.insertLecture(lecture);
		return "redirect:/auth/manager/lectureList/1";
	}
	// 강의 개설 폼
	@GetMapping("/auth/manager/insertLecture")
	public String insertLecture(Model model) {
		//강의 개설 시 필요한 리스트
		//강사 계정 리스트
		List<Account> accountList = managerAccountService.getAccountList();
		//교과목 리스트
		List<Subject> subjectList = managerSubjectService.getSubjectList();
		//교재 리스트
		List<Textbook> textbookList = managertextbookService.getTextbookList();
		//강의실 리스트
		List<Classroom> classroomList = managerClassroomService.getClassroomList();
		model.addAttribute("accountList", accountList);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("textbookList", textbookList);
		model.addAttribute("classroomList", classroomList);
		
		return "/auth/manager/insertLecture";
	}
	//강의 상세 보기
	@GetMapping("/auth/manager/lectureOne/{lectureNo}")
	public String lectureOne(Model model, @PathVariable(value = "lectureNo") int lectureNo) {
		LectureAndClassAndTextbook lectureAndClassAndTextbook = managerLectureService.getLectureOne(lectureNo);
		System.out.println(lectureAndClassAndTextbook);
		model.addAttribute("lct", lectureAndClassAndTextbook);
		
		return "/auth/manager/lectureOne";
	}
	
	//강의 수정 액션
	@PostMapping("/auth/manager/updateLecture/{lectureNo}")
	public String updateLecture(Lecture lecture) {
		return "redirect:/auth/manager/lectureList/1";
	}
	//강의 수정 폼
	@GetMapping("/auth/manager/updateLecture/{lectureNo}")
	public String updateLecture(Model model, @PathVariable(value = "lectureNo") int lectureNo){
		LectureAndClassAndTextbook LectureAndClassAndTextbook = managerLectureService.getLectureOne(lectureNo);
		//강의 수정 시 편의성을 위해 필요한 리스트 
		//강사 계정 리스트
		List<Account> accountList = managerAccountService.getAccountList();
		//교과목 리스트
		List<Subject> subjectList = managerSubjectService.getSubjectList();
		//교재 리스트
		List<Textbook> textbookList = managertextbookService.getTextbookList();
		//강의실 리스트
		List<Classroom> classroomList = managerClassroomService.getClassroomList();
		model.addAttribute("lct",LectureAndClassAndTextbook);
		model.addAttribute("accountList", accountList);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("textbookList", textbookList);
		model.addAttribute("classroomList", classroomList);
		
		return "/auth/manager/updateLecture";
	}
}
