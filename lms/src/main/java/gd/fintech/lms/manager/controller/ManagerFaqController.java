package gd.fintech.lms.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@GetMapping("/auth/manager/faq/faqList/{currentPage}")
	public String faqList(Model model,
			@PathVariable(name = "currentPage") int currentPage) {
		int rowPerPage = 10;	// 한 페이지에 출력할 개수
		int totalCount = managerFaqService.getCountFaq(rowPerPage);	// 총 페이지
		int beginRow = (currentPage -1) * rowPerPage;	// 시작페이지
		int lastPage = 0; 		// 마지막 페이지	
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		} else {
			lastPage = totalCount / rowPerPage + 1;			
		}
		Map<String, Object> map = new HashMap<>();	// FAQ 목록 출력
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		List<Faq> faqList = managerFaqService.getFaqListByPage(map); // FAQ 목록

		int navPerPage = 10; 											// 네비에 출력할 페이지 개수
		
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;// 네비의 첫번째 페이지
		
		int navLastPage = navFirstPage + navPerPage - 1; 				// 네비의 마지막 페이지
		
		//현재 페이지가 10으로 나누어 떨어질 때
		if (currentPage % navPerPage == 0 && currentPage != 0) {
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
		
		// 현재 페이지에 대한 이전 페이지
		int prePage;
		if (currentPage > 10) {
			prePage = currentPage - (currentPage % navPerPage) + 1 - 10;
		} else {
			prePage = 1;
		}

		// 현재 페이지에 대한 다음 페이지
		int nextPage = currentPage - (currentPage % navPerPage) + 1 + 10;
		if (nextPage > lastPage) {
			nextPage = lastPage;
		}
		
		// model을 통해 View에 다음과 같은 정보를 보내준다.
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
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
		return "redirect:/auth/manager/faq/faqList/1";
	}
	
	@GetMapping("/auth/manager/faq/deleteFaq/{faqNo}")
	public String deleteFaq(
			@PathVariable(name="faqNo") int faqNo) {
		managerFaqService.deleteFaq(faqNo);
		return "redirect:/auth/manager/faq/faqList/1";
	}
	
	@GetMapping("/auth/manager/faq/updateFaq/{faqNo}")
	public String updateFaq(Model model,
			@PathVariable(name="faqNo") int faqNo) {
		List<FaqCategory> faqCategoryList = managerFaqCategoryService.getFaqCategoryList();
		Faq faq = managerFaqService.getFaqOne(faqNo);
		model.addAttribute("faq", faq);
		model.addAttribute("faqCategoryList", faqCategoryList);
		return "auth/manager/faq/updateFaq";
	}
	
	@PostMapping("/auth/manager/faq/updateFaq")
	public String updateFaq(Faq faq) {
		managerFaqService.updateFaq(faq);
		return "redirect:/auth/manager/faq/faqList/1";
	}
	
	@GetMapping("/auth/manager/faq/faqOne/{faqNo}")
	public String faqOne(Model model,
			@PathVariable(name = "faqNo") int faqNo) {
		managerFaqService.updateFaqCountUp(faqNo);
		Faq faq = managerFaqService.getFaqOne(faqNo);
		model.addAttribute("faq", faq);
		return "auth/manager/faq/faqOne";
	}
} 
