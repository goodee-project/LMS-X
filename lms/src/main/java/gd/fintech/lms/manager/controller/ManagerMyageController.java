package gd.fintech.lms.manager.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.manager.service.ManagerMypageService;
import gd.fintech.lms.vo.Career;
import gd.fintech.lms.vo.Manager;

@Controller
public class ManagerMyageController {
	@Autowired private ManagerMypageService managerMypageService;
	
	private static final Logger log = LoggerFactory.getLogger(ManagerMyageController.class);
	
	// 운영자 마이페이지
	@GetMapping("/auth/manager/mypage/mypageOne")
	public String selectManagerMyPage(Model model, HttpSession session) {
		
		String accountId = (String)session.getAttribute("loginId");
		Manager manager = managerMypageService.selectManagerMypage(accountId);
		log.debug(manager.toString());
		
		model.addAttribute("manager", manager);
		return "auth/manager/mypage/mypageOne";
	}
	
	// 운영자 마이페이지 수정
	@GetMapping("/auth/manager/mypage/updateMypage")
	public String updateMypage(Model model,HttpSession session) {
		String accountId = (String)session.getAttribute("loginId");
		Manager manager = managerMypageService.selectManagerMypage(accountId);
		
		model.addAttribute("manager",manager);
		return "auth/manager/mypage/updateMypage";
	}
	@PostMapping("/auth/manager/mypage/updateMypage")
	public String updateMypage(Manager manager) {
		
		managerMypageService.updateManagerMypage(manager);
		return "redirect:/auth/manager/mypage/mypageOne";
	}
		
	
}
