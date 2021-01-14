package gd.fintech.lms.teacher.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.teacher.service.TeacherLectureArchiveService;
import gd.fintech.lms.vo.LectureArchive;
import gd.fintech.lms.vo.LectureArchiveForm;

@Controller
public class TeacherLectureArchiveController {
	@Autowired private TeacherLectureArchiveService teacherLectureArchiveService;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 자료 목록
	@GetMapping("/auth/teacher/lecture/{lectureNo}/archive/archiveList/{currentPage}")
	public String lectureArchiveList(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo,
			@PathVariable(value = "currentPage") int currentPage) {
		// 한 페이지에 표시할 데이터 수
		int rowPerPage = 10;
		
		// 시작 페이지 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		
		// [Logger] 데이터베이스로부터 강사가 속해있는 강좌 목록을 가져온다
		List<LectureArchive> teacherLectureArchiveList = teacherLectureArchiveService.getTeacherLectureArchiveListByPage(lectureNo, beginRow, rowPerPage);
		logger.trace("teacherLectureArchiveList[" + teacherLectureArchiveList + "]");
		
		// 페이징 코드
		// 전체 데이터 수
		int totalCount = teacherLectureArchiveService.getCountTeacherLectureArchive(lectureNo);
		
		// 마지막 페이지
		int lastPage = totalCount / rowPerPage;
		
		// 10 미만의 개수의 데이터가 있는 페이지를 표시
		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		
		// 전체 페이지가 0개이면 현재 페이지도 0으로 표시
		if (lastPage == 0) {
			currentPage = 0;
		}
		
		// 내비게이션에 표시할 페이지 수
		int navPerPage = 10;
		
		// 내비게이션 첫번째 페이지
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;	
		
		// 내비게이션 마지막 페이지
		int navLastPage = navFirstPage + navPerPage - 1;
		
		// 10으로 나누어 떨어지는 경우 처리하는 코드
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
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("teacherLectureArchiveList", teacherLectureArchiveList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		// [View] /auth/teacher/lecture/archive/archiveList.jsp
		return "/auth/teacher/lecture/archive/archiveList";
	}
	
	// 자료 조회
	@GetMapping("/auth/teacher/lecture/{lectureNo}/archive/archiveOne/{archiveNo}")
	public String archiveOne(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo, 		// 강좌 고유번호
			@PathVariable(value = "archiveNo") int archiveNo) {		// 자료 고유번호
		// 자료 조회 조회수 증가
		teacherLectureArchiveService.updateTeacherLectureArchiveCountUp(archiveNo);
		
		// 자료 조회
		List<LectureArchive> lectureArchive = teacherLectureArchiveService.selectTeacherLectureArchiveOne(archiveNo);
		
		// [Logger] 세션에 있는 teacherId, teacherName 확인
		logger.trace("lectureArchive[ " + lectureArchive + " ]");
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("lectureArchive", lectureArchive);
		
		// [View] /auth/teacher/lecture/archive/archiveOne.jsp
		return "/auth/teacher/lecture/archive/archiveOne";
	}
	
	// 자료 입력 Form
	@GetMapping("/auth/teacher/lecture/{lectureNo}/archive/insertArchive")
	public String insertArchive(Model model, HttpSession session, 
			@PathVariable(value = "lectureNo") int lectureNo) {
		// 세션에 있는 아이디와 이름을 가져온다 (강사)
		String teacherId = (String)session.getAttribute("loginId");
		String teacherName = (String)session.getAttribute("loginName");
		
		// [Logger] 세션에 있는 teacherId, teacherName 확인
		logger.trace("nowSession[ " + teacherId + ", " + teacherName + " ]");
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("teacherId", teacherId);
		model.addAttribute("teacherName", teacherName);
		
		// [View] /auth/teacher/lecture/archive/insertArchive.jsp
		return "/auth/teacher/lecture/archive/insertArchive";
	}
	
	// 자료 입력 Action
	@PostMapping("/auth/teacher/lecture/{lectureNo}/archive/insertArchive")
	public String insertArchive(LectureArchiveForm lectureArchiveForm, HttpServletRequest request) {
		LectureArchive lectureArchive = teacherLectureArchiveService.insertTeacherLectureArchive(lectureArchiveForm, request);
		
		// [Redirect] 자료 입력 후 새로 생성된 강좌 고유번호(lectureNo)에 해당하는 게시글로 이동
		return "redirect:/auth/teacher/lecture/" + lectureArchiveForm.getLectureNo() + "/archive/archiveOne/" + lectureArchive.getLectureArchiveNo();
	}
	
	// 자료 수정 Form
	@GetMapping("/auth/teacher/lecture/{lectureNo}/archive/updateArchive/{archiveNo}")
	public String updateArchive(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo, 		// 강좌 고유번호
			@PathVariable(value = "archiveNo") int archiveNo) {		// 자료 고유번호
		List<LectureArchive> lectureArchive = teacherLectureArchiveService.selectTeacherLectureArchiveOne(archiveNo);
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("lectureArchive", lectureArchive);
		
		// [View] /auth/teacher/lecture/archive/updateArchive.jsp
		return "/auth/teacher/lecture/archive/updateArchive";
	}
	
	// 자료 수정 Action
	@PostMapping("/auth/teacher/lecture/{lectureNo}/archive/updateArchive")
	public String updateArchive(LectureArchiveForm lectureArchiveForm, HttpServletRequest request) {
		// [Logger] 자료 Form(lectureArchiveForm)
		logger.trace("lectureArchiveForm[ " + lectureArchiveForm + "]");
		
		teacherLectureArchiveService.updateTeacherLectureArchive(lectureArchiveForm, request);
		
		// [Redirect] 강좌 고유번호(lectureNo)에 해당하는 게시글로 이동
		return "redirect:/auth/teacher/lecture/" + lectureArchiveForm.getLectureNo() + "/archive/archiveOne/" + lectureArchiveForm.getLectureArchiveNo();
	}
	
	// 자료 삭제
	@GetMapping("/auth/teacher/lecture/{lectureNo}/archive/deleteArchive/{archiveNo}")
	public String deleteArchive(Model model, HttpServletRequest request,
			@PathVariable(value = "lectureNo") int lectureNo, 		// 강좌 고유번호
			@PathVariable(value = "archiveNo") int archiveNo) {		// 자료 고유번호
		teacherLectureArchiveService.deleteTeacherLectureArchive(archiveNo, request);
		
		// [Redirect] 자료 삭제시 이동할 페이지가 없으므로 자료 목록의 1페이지로 이동
		return "redirect:/auth/teacher/lecture/" + lectureNo + "/archive/archiveList/1";
	}	
}