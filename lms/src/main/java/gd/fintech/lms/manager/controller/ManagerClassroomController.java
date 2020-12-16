package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.manager.mapper.ManagerClassroomMapper;
import gd.fintech.lms.manager.service.ManagerClassroomService;
import gd.fintech.lms.vo.Classroom;

@Controller
public class ManagerClassroomController {
	@Autowired private ManagerClassroomService managerClassroomService;
	
	@GetMapping("/auth/manager/classroomList")
	public String classroomList(Model model) {
		List<Classroom> classroomList = managerClassroomService.getClassroomList();
		model.addAttribute("classroomList", classroomList);
		return "auth/manager/classroomList";
	}
	
	@GetMapping("/auth/manager/insertClassroom")
	public String insertClassroom() {
		return "auth/manager/insertClassroom";
	}
	
	@PostMapping("/auth/manager/insertClassroom")
	public String insertClassroom(Classroom classroom) {
		managerClassroomService.insertClassroom(classroom);
		return "redirect:/auth/manager/classroomList";
	}
	
	@GetMapping("/auth/manager/deleteClassroom")
	public String deleteClassroom(int classroomNo) {
		managerClassroomService.deleteClassroom(classroomNo);
		return "redirect:/auth/manager/classroomList";
	}
	
	@PostMapping("/auth/manager/updateClassroom")
	public String updateClassroom(Classroom classroom) {
		managerClassroomService.updateClassroom(classroom);
		return "redirect:/auth/manager/updateClassroom";
	}
	
	@GetMapping("/auth/manager/updateClassroom/{classroomNo}")
	public String updateClassroom(Model model,
		@PathVariable(name="classroomNo") int classroomNo) {
		
		// model.addAttribute("classroom", classroom);
		return "/auth/manager/updateClassroom";
	}
}
