package gd.fintech.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.service.ManagerFaqService;
import gd.fintech.lms.vo.Faq;

@Controller
public class ManagerFaqController {
	@Autowired private ManagerFaqService managerFaqService;
	
	@GetMapping("/auth/manager/faqList")
	public String faqList(Model model) {
		List<Faq> faqList = managerFaqService.getFaqList();
		model.addAttribute("faqList", faqList);
		return "auth/manager/faqList";
	}
}
