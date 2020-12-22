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

import gd.fintech.lms.manager.service.ManagerClassroomService;
import gd.fintech.lms.vo.Classroom;

@Controller
public class ManagerClassroomController {
	@Autowired private ManagerClassroomService managerClassroomService;
	
	@GetMapping("/auth/manager/classroom/classroomList/{currentPage}")
	public String classroomList(Model model,
			@PathVariable(name = "currentPage") int currentPage) {
		int rowPerPage = 10;	// 한 페이지에 출력할 개수
		int totalCount = managerClassroomService.getCountClassroom(rowPerPage);	// 총 페이지
		int beginRow = (currentPage -1) * rowPerPage;	// 시작페이지
		int lastPage = 0; 		// 마지막 페이지	
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		} else {
			lastPage = totalCount / rowPerPage + 1;			
		}
		Map<String, Object> map = new HashMap<>();	// 강의 목록 출력
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		List<Classroom> classroomList = managerClassroomService.getClassroomListByPage(map);	// 강의 목록
		
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
		
		model.addAttribute("classroomList", classroomList);
		
		return "auth/manager/classroom/classroomList";
	}
	
	@GetMapping("/auth/manager/classroom/insertClassroom")
	public String insertClassroom() {
		return "auth/manager/classroom/insertClassroom";
	}
	
	@PostMapping("/auth/manager/classroom/insertClassroom")
	public String insertClassroom(Classroom classroom) {
		managerClassroomService.insertClassroom(classroom);
		return "redirect:/auth/manager/classroom/classroomList/1";
	}
	
	@GetMapping("/auth/manager/classroom/deleteClassroom/{classroomNo}")
	public String deleteClassroom(
			@PathVariable(name = "classeoomNo") int classroomNo) {
		managerClassroomService.deleteClassroom(classroomNo);
		return "redirect:/auth/manager/classroom/classroomList/1";
	}
	
	@GetMapping("/auth/manager/classroom/updateClassroom/{classroomNo}")
	public String updateClassroom(Model model,
			@PathVariable(name="classroomNo") int classroomNo) {
		Classroom classroom = managerClassroomService.getClassroomOne(classroomNo);
		model.addAttribute("classroom", classroom);
		return "auth/manager/classroom/updateClassroom";
	}
	
	@PostMapping("/auth/manager/classroom/updateClassroom")
	public String updateClassroom(Classroom classroom) {
		managerClassroomService.updateClassroom(classroom);
		return "redirect:/auth/manager/classroom/classroomList/1";
	}
}
