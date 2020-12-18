package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

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
	
	@GetMapping("/auth/manager/textbook/insertTextbook")
	public String insertTextbook() {
		return "auth/manager/textbook/insertTextbook";
	}
	
	@PostMapping("/auth/manager/textbook/insertTextbook")
	public String insertTextbook(Textbook textbook) {
		managerTextbookService.insertTextbook(textbook);
		return "redirect:/auth/manager/textbook/textbookList";
	}
	
	@GetMapping("/auth/manager/textbook/deleteTextbook/{textbookIsbn}")
	public String deleteTextbook(
		@PathVariable(name = "textbookIsbn") String textbookIsbn) {
		managerTextbookService.deleteTextbook(textbookIsbn);
		return "redirect:/auth/manager/textbook/textbookList";
	}
	
	@GetMapping("/auth/manager/textbook/updateTextbook/{textbookIsbn}")
	public String updateTextbook(Model model,
		@PathVariable(name="textbookIsbn") String textbookIsbn) {
		Textbook textbook = managerTextbookService.getTextbookOne(textbookIsbn);
		System.out.println(textbook);
		model.addAttribute("textbook", textbook);
		return "auth/manager/textbook/updateTextbook";
	}
	
	@PostMapping("/auth/manager/textbook/updateTextbook")
	public String updateTextbook(Textbook textbook) {
		managerTextbookService.updateTextbook(textbook);
		return "redirect:/auth/manager/textbook/textbookList";
	}
	
	@GetMapping("/auth/manager/textbook/textbookOne/{textbookIsbn}")
	public String textbookOne(Model model,
		@PathVariable(name = "textbookIsbn") String textbookIsbn) {
		Textbook textbook = managerTextbookService.getTextbookOne(textbookIsbn);
		model.addAttribute("textbook", textbook);
		return "auth/manager/textbook/textbookOne";
	}
}
