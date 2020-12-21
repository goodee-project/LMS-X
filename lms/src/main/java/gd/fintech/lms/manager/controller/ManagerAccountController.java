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
import gd.fintech.lms.vo.Account;

@Controller
public class ManagerAccountController {
	@Autowired private ManagerAccountService managerAccountService;
	
	@GetMapping("/auth/manager/account/accountList/{currentPage}")
	public String accountList(Model model,
			@PathVariable(name = "currentPage") int currentPage) {
		int rowPerPage = 10;	// 한 페이지에 출력할 개수
		int totalCount = managerAccountService.getCountAccount(rowPerPage);	// 총 페이지
		int beginRow = (currentPage -1) * rowPerPage;	// 시작페이지
		int lastPage = 0; 		// 마지막 페이지	
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		} else {
			lastPage = totalCount / rowPerPage + 1;			
		}
		Map<String, Object> map = new HashMap<>();	// 교재 목록 출력
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		List<Account> accountList = managerAccountService.getManagerAccountListByPage(map);

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
						
		model.addAttribute("accountList", accountList);
		return "auth/manager/account/accountList";
	}
	
	@GetMapping("/auth/manager/account/updateAccount/{accountId}")
	public String updateAccount(Model model,
			@PathVariable(name="accountId") String accountId) {
		Account account = managerAccountService.getAccountOne(accountId);
		System.out.println(account);
		model.addAttribute("account", account);
		return "auth/manager/account/updateAccount";
	}
	
	@PostMapping("/auth/manager/account/updateAccount")
	public String updateAccount(Account account) {
		managerAccountService.updateAccount(account);
		return "redirect:/auth/manager/account/accountList";
	}
	
	@GetMapping("/auth/manager/account/accountOne/{accountId}")
	public String accountOne(Model model,
			@PathVariable(name = "accountId") String accountId) {
		Account account = managerAccountService.getAccountOne(accountId);
		model.addAttribute("account", account);
		return "auth/manager/account/accountOne";
	}
}
