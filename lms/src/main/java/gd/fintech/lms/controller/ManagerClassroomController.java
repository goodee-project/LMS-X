package gd.fintech.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.service.ManagerClassroomService;
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
}
