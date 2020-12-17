package gd.fintech.lms.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.admin.service.AdminIndexService;
import gd.fintech.lms.vo.Manager;

@Controller
public class AdminIndexController {
	@Autowired private AdminIndexService adminIndexService;
	
	private static final Logger log = LoggerFactory.getLogger(AdminIndexController.class);

	@GetMapping("/auth/admin/index")
	public String index(Model model, HttpSession session) {
			
		// 운영자 리스트 출력
		List<Manager> managerList = adminIndexService.getManagerList(); 
		log.debug(managerList.toString());
		
		model.addAttribute("managerList",managerList);
		return "auth/admin/index";
	}
}
