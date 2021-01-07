package gd.fintech.lms.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.lms.manager.service.ManagerTeacherService;
import gd.fintech.lms.vo.MypageImage;
import gd.fintech.lms.vo.Teacher;
import gd.fintech.lms.vo.TeacherQueue;

@Controller
public class ManagerTeacherController {
	@Autowired private ManagerTeacherService managerTeacherService;
	
	// 강사 목록
	@GetMapping("/auth/manager/teacher/teacherList/{currentPage}")
	public String teacherList(Model model,
			@PathVariable(name = "currentPage") int currentPage,
			@RequestParam(name="searchText", defaultValue = "") String searchText) {
		
		// 한 페이지에 출력할 개수
		int rowPerPage = 10;	

		// 시작페이지
		int beginRow = (currentPage -1) * rowPerPage;	
		
		// 총 페이지
		int totalCount = managerTeacherService.getCountTeacher(searchText);	
		
		// 마지막 페이지
		int lastPage = totalCount / rowPerPage; 	
		
		// 10 미만의 개수의 데이터가 있는 페이지 표시
		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		// 전체 페이지가 0개이면 현재 페이지도 0으로 표시
		if (lastPage == 0) {
			currentPage = 0;
		}
		
		// 강사 목록
		List<Teacher> teacherList = managerTeacherService.getTeacherListByPage(beginRow, rowPerPage, searchText); 
		
		// 네비에 출력할 페이지 개수
		int navPerPage = 10; 											
		
		// 네비의 첫번째 페이지
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;
		
		// 네비의 마지막 페이지
		int navLastPage = navFirstPage + navPerPage - 1; 				
		
		//현재 페이지가 10으로 나누어 떨어질 때
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
		
		// model을 통해 View에 다음과 같은 정보를 보내준다.
		model.addAttribute("searchText", searchText);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
						
		model.addAttribute("teacherList", teacherList);
		return "auth/manager/teacher/teacherList";
	}
	
	// 강사 상세보기
	@GetMapping("/auth/manager/teacher/teacherOne/{teacherId}")
	public String teacherOne(Model model,
			@PathVariable(name = "teacherId") String teacherId) {
		Teacher teacher = managerTeacherService.getTeacherOne(teacherId);
		MypageImage mypageImage = managerTeacherService.getTeacherImage(teacherId);
		
		String teacherImage = null;
		
		if (mypageImage == null) {
			teacherImage = "default.png";
		} else {
			teacherImage = mypageImage.getMypageImageUuid();
		}
		
		model.addAttribute("teacher", teacher);
		model.addAttribute("teacherImage",teacherImage);
		return "auth/manager/teacher/teacherOne";
	}
	
	// 강사 승인대기 출력
	@GetMapping("/auth/manager/teacher/teacherQueueList/{currentPage}")
	public String teacherQueueList(Model model,
			@PathVariable(name = "currentPage") int currentPage) {
		
		// 한 페이지에 출력할 개수
		int rowPerPage = 10;	
		
		// 시작 페이지 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		
		// 총 페이지
		int totalCount = managerTeacherService.getCountTeacherQueue(rowPerPage);
		
		// 마지막 페이지
		int lastPage = totalCount / rowPerPage; 	
		
		// 10 미만의 개수의 데이터가 있는 페이지 표시
		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		// 전체 페이지가 0개이면 현재 페이지도 0으로 표시
		if (lastPage == 0) {
			currentPage = 0;
		}
		
		// 교재 목록 출력
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		List<TeacherQueue> teacherQueueList = managerTeacherService.getTeacherQueueListByPage(map); // 학생 목록
		
		// 내비게이션에 표시할 페이지 수
		int navPerPage = 10;
		
		// 내비게이션 첫 번째 페이지
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;
		
		// 내비게이션 마지막 페이지
		int navLastPage = navFirstPage + navPerPage - 1;
		
		//현재 페이지가 10으로 나누어 떨어질 때
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
		
		// model을 통해 View에 다음과 같은 정보를 보내준다.
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
				
		model.addAttribute("teacherQueueList", teacherQueueList);

		return "auth/manager/teacher/teacherQueueList";
	}
	
	// 강사 승인 거절
	@GetMapping("/auth/manager/teacher/negativeTeacher/{accountId}")
	public String negativeTeacher(
			@PathVariable(name="accountId") String accountId) {
		managerTeacherService.negativeTeacher(accountId);
		return "redirect:/auth/manager/teacher/teacherQueueList/1";
	}
	
	// 운영자 승인
	@GetMapping("/auth/manager/teacher/accessTeacher/{currentPage}/{accountId}")
	public String accessTeacher(HttpSession session,
			@PathVariable(name="currentPage") String currentPage, 
			@PathVariable(name="accountId") String accountId) {
		
		String loginId = (String)session.getAttribute("loginId");
		
		managerTeacherService.accessTeacher(accountId, loginId);
		return "redirect:/auth/manager/teacher/teacherQueueList/1";
	}
	
	// 강사 탈퇴
	@GetMapping("/auth/manager/teacher/deleteTeacher/{currentPage}/{accountId}")
	public String deleteTeacherAll(@PathVariable(name="currentPage") int currentPage,
								   @PathVariable(name="accountId") String accountId) {
		
		managerTeacherService.deleteTeacherOneAll(accountId);
		
		return "redirect:/auth/manager/teacher/teacherList/"+currentPage;
	}
	
}
