package gd.fintech.lms.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.admin.service.AdminManagerService;
import gd.fintech.lms.vo.ManagerQueue;

@Controller
public class AdminManagerController {
	@Autowired private AdminManagerService adminManagerService;
		
	private static final Logger log = LoggerFactory.getLogger(AdminManagerController.class);

	// 운영자 승인대기 출력
	@GetMapping("/auth/admin/managerQueue")
	public String managerAccessQueueList(Model model){
		log.debug("managerAccessQueueList 접속 성공");
		List<ManagerQueue> managerQueueList = adminManagerService.getManagerQueueList(); 
		
		model.addAttribute("managerQueueList",managerQueueList);
		return "auth/admin/manager/managerQueueList";
	}
	
	// 운영자 승인 거절
	@GetMapping("/auth/admin/negativeManager/{accountId}")
	public String negativeManager(@PathVariable(name="accountId") String accountId){
		adminManagerService.negativeManager(accountId);
		return "redirect:/auth/admin/managerQueue";
	}
	// 운영자 승인
	@GetMapping("/auth/admin/accessManager/{accountId}")
	public String accessManager(@PathVariable(name="accountId") String accountId){
		adminManagerService.accessManager(accountId);
		return "redirect:/auth/admin/managerQueue";
	}
}
