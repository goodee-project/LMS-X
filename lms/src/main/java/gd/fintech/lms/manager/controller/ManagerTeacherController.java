package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.manager.service.ManagerTeacherService;
import gd.fintech.lms.vo.Teacher;

@Controller
public class ManagerTeacherController {
	@Autowired private ManagerTeacherService managerTeacherService;
	
	@GetMapping("/auth/manager/teacher/teacherList")
	public String teacherList(Model model) {
		List<Teacher> teacherList = managerTeacherService.getTeacherList();
		model.addAttribute("teacherList", teacherList);
		return "auth/manager/teacher/teacherList";
	}
}
