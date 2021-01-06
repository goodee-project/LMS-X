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

import gd.fintech.lms.manager.service.ManagerStudentService;
import gd.fintech.lms.vo.MypageImage;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.StudentQueue;

@Controller
public class ManagerStudentController {
	@Autowired private ManagerStudentService managerStudentService;
	
	// 학생 리스트 출력
	@GetMapping("/auth/manager/student/studentList/{currentPage}")
	public String studentList(Model model,
			@PathVariable(name = "currentPage") int currentPage,
			@RequestParam(name="searchText", defaultValue = "") String searchText) {
		
		// 한 페이지에 출력할 개수
		int rowPerPage = 10;
		
		// 시작페이지
		int beginRow = (currentPage -1) * rowPerPage;	
		
		// 총 페이지
		int totalCount = managerStudentService.getCountStudent(searchText);	
		
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
		
		// 학생 목록
		List<Student> studentList = managerStudentService.getStudentListByPage(beginRow, rowPerPage, searchText);
		
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
				
		model.addAttribute("studentList", studentList);

		return "auth/manager/student/studentList";
	}
	
	// 학생 상세보기 페이지 출력
	@GetMapping("/auth/manager/student/studentOne/{studentId}")
	public String studentOne(Model model,
			@PathVariable(name = "studentId") String studentId) {
		Student student = managerStudentService.getStudentOne(studentId);
		
		MypageImage mypageImage = managerStudentService.getTeacherImage(studentId);
		
		String studentImage = null;
		
		if (mypageImage == null) {
			studentImage = "default.png";
		} else {
			studentImage = mypageImage.getMypageImageUuid();
		}
		
		model.addAttribute("student", student);
		model.addAttribute("studentImage",studentImage);
		return "auth/manager/student/studentOne";
	}
	
	
	// 학생 승인대기 출력
	@GetMapping("/auth/manager/student/studentQueueList/{currentPage}")
	public String studentQueueList(Model model,
			@PathVariable(name = "currentPage") int currentPage) {
		int rowPerPage = 10;	// 한 페이지에 출력할 개수
		int totalCount = managerStudentService.getCountStudentQueue(rowPerPage);	// 총 페이지
		int beginRow = (currentPage -1) * rowPerPage;	// 시작페이지
		int lastPage = 0; 		// 마지막 페이지	
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		} else {
			lastPage = totalCount / rowPerPage + 1;			
		}
		Map<String, Object> map = new HashMap<>();	// 교재 목록 출력
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		List<StudentQueue> studentQueueList = managerStudentService.getStudentQueueListByPage(map); // 학생 목록
		
		int navPerPage = 10; 											// 네비에 출력할 페이지 개수
		
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;// 네비의 첫번째 페이지
		
		int navLastPage = navFirstPage + navPerPage - 1; 				// 네비의 마지막 페이지
		
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
				
		model.addAttribute("studentQueueList", studentQueueList);

		return "auth/manager/student/studentQueueList";
	}
	
	// 학생 승인 거절
	@GetMapping("/auth/manager/student/negativeStudent/{accountId}")
	public String negativeStudent(
			@PathVariable(name="accountId") String accountId) {
		managerStudentService.negativeStudent(accountId);
		return "redirect:/auth/manager/student/studentQueueList/1";
	}
	
	// 학생 승인
	@GetMapping("/auth/manager/student/accessStudent/{currentPage}/{accountId}")
	public String accessStudent(HttpSession session,
			@PathVariable(name="currentPage") String currentPage, 
			@PathVariable(name="accountId") String accountId) {
		
		String loginId = (String)session.getAttribute("loginId");
		
		managerStudentService.accessStudent(accountId, loginId);
		return "redirect:/auth/manager/student/studentQueueList/1";
	}
	
	// 학생 탈퇴
	@GetMapping("/auth/manager/student/deleteStudent/{currentPage}/{studentId}")
	public String deleteManager(
			@PathVariable(name="currentPage") String currentPage,
			@PathVariable(name="studentId") String studentId) {
		managerStudentService.deleteStudentAll(studentId);
		return "redirect:/auth/manager/student/studentList/1";
	}
}
