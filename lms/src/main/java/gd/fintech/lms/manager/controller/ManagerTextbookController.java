package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gd.fintech.lms.manager.service.ManagerTextbookService;
import gd.fintech.lms.vo.Textbook;

@Controller
public class ManagerTextbookController {
	@Autowired private ManagerTextbookService managerTextbookService;
	
	@GetMapping("/auth/manager/textbook/textbookList")
	public String textbookList(Model model) {
		List<Textbook> textbookList = managerTextbookService.getTextbookList();
		model.addAttribute("textbookList", textbookList);
		return "auth/manager/textbook/textbookList";
	}
}
