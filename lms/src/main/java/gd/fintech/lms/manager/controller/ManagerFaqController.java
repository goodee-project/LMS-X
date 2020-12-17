package gd.fintech.lms.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.manager.service.ManagerAccountService;
import gd.fintech.lms.manager.service.ManagerFaqCategoryService;
import gd.fintech.lms.manager.service.ManagerFaqService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Faq;
import gd.fintech.lms.vo.FaqCategory;

@Controller
public class ManagerFaqController {
	@Autowired private ManagerFaqService managerFaqService;
	@Autowired private ManagerAccountService managerAccountService;
	@Autowired private ManagerFaqCategoryService managerFaqCategoryService;
	
	@GetMapping("/auth/manager/faq/faqList")
	public String faqList(Model model) {
		List<Faq> faqList = managerFaqService.getFaqList();
		model.addAttribute("faqList", faqList);
		return "auth/manager/faq/faqList";
	}
	
	@GetMapping("/auth/manager/faq/insertFaq")
	public String insertFaq(Model model) {
		List<Account> accountList = managerAccountService.getFaqAccountList();
		List<FaqCategory> faqCategoryList = managerFaqCategoryService.getFaqCategoryList();
		model.addAttribute("accountList", accountList);
		model.addAttribute("faqCategoryList", faqCategoryList);
		return "auth/manager/faq/insertFaq";
	}
	
	@PostMapping("/auth/manager/faq/insertFaq")
	public String insertFaq(Faq faq) {
		System.out.println(faq);
		managerFaqService.insertFaq(faq);
		return "redirect:/auth/manager/faq/faqList";
	}
	
	@GetMapping("/auth/manager/faq/deleteFaq/{faqNo}")
	public String deleteFaq(
		@PathVariable(name="faqNo") int faqNo) {
		managerFaqService.deleteFaq(faqNo);
		return "redirect:/auth/manager/faq/faqList";
	}
	
	@GetMapping("/auth/manager/faq/updateFaq/{faqNo}")
	public String updateFaq(Model model,
		@PathVariable(name="faqNo") int faqNo) {
		List<FaqCategory> faqCategoryList = managerFaqCategoryService.getFaqCategoryList();
		Faq faqOne = managerFaqService.faq(faqNo);
		model.addAttribute("faq", faqOne);
		model.addAttribute("faqCategoryList", faqCategoryList);
		return "auth/manager/faq/updateFaq";
	}
	
	@PostMapping("/auth/manager/faq/updateFaq")
	public String updateFaq(Faq faq) {
		managerFaqService.updateFaq(faq);
		return "redirect:/auth/manager/faq/faqList";
	}
} 
