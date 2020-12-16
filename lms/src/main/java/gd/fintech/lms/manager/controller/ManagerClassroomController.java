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
	
	@GetMapping("/auth/manager/classroom/classroomList")
	public String classroomList(Model model) {
		List<Classroom> classroomList = managerClassroomService.getClassroomList();
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
		return "redirect:/auth/manager/classroom/classroomList";
	}
	
	@GetMapping("/auth/manager/classroom/deleteClassroom")
	public String deleteClassroom(int classroomNo) {
		managerClassroomService.deleteClassroom(classroomNo);
		return "redirect:/auth/manager/classroom/classroomList";
	}
	
	@PostMapping("/auth/manager/classroom/updateClassroom")
	public String updateClassroom(Classroom classroom) {
		managerClassroomService.updateClassroom(classroom);
		return "redirect:/auth/manager/classroom/classroomList";
	}
	
	@GetMapping("/auth/manager/classroom/updateClassroom/{classroomNo}")
	public String updateClassroom(Model model,
		@PathVariable(name="classroomNo") int classroomNo) {
		Classroom classroomOne = managerClassroomService.classroomOne(classroomNo);
		model.addAttribute("classroom", classroomOne);
		return "auth/manager/classroom/updateClassroom";
	}
}
