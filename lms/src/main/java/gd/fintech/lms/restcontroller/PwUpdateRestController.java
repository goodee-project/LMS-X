package gd.fintech.lms.restcontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.restservice.PwUpdateRestService;

@RestController
public class PwUpdateRestController {
	@Autowired private PwUpdateRestService pwUpdateRestService;
	
	// 비밀번호로 계정 찾기
	@GetMapping("/auth/pwUpdate/selectPw/{accountPw}") 
	public String selectAccount(HttpSession session,@PathVariable(name="accountPw") String accountPw) {
		
		String accountId = (String)session.getAttribute("loginId");
		
		return pwUpdateRestService.selectAccount(accountId, accountPw);
	}
	
	@GetMapping("/auth/pwUpdate/updatePw/{accountPw}")
	public void updateAccountPw(HttpSession session, @PathVariable(name="accountPw") String accountPw) {
		
		String accountId = (String)session.getAttribute("loginId");
		
		pwUpdateRestService.updateAccount(accountId, accountPw);
	}
}
