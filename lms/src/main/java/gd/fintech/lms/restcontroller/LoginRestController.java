package gd.fintech.lms.restcontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.restservice.LoginRestService;

@RestController
public class LoginRestController {
	@Autowired private LoginRestService loginRestService;
	@GetMapping("/login/stateCheck/{accountId}/{accountPw}/{accountLevel}")
	public String loginStateCheck(@PathVariable(name="accountId") String accountId,
								  @PathVariable(name="accountPw") String accountPw,
								  @PathVariable(name="accountLevel") int accountLevel) {
		return loginRestService.CheckAccountState(accountId, accountPw, accountLevel);
	}

	//로그아웃
	@GetMapping("/auth/Restlogout")
	public void logout(HttpSession session) {
		// session데이터 삭제
		session.invalidate(); 
	}
}
