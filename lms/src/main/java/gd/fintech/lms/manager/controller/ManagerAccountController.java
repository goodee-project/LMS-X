package gd.fintech.lms.manager.controller;

import java.util.List;

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
	
	@GetMapping("/auth/manager/account/accountList")
	public String accountList(Model model) {
		List<Account> accountList = managerAccountService.getManagerAccountList();
		System.out.println(accountList);
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
