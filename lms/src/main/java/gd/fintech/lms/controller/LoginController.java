package gd.fintech.lms.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.service.LoginService;
import gd.fintech.lms.vo.Account;

@Controller
public class LoginController {
	@Autowired LoginService loginService;
	
	//로그인 페이지 이동
	@GetMapping({"/","/login"})
	public String login() {
		
		return "login";
	}
	
	//로그인 시 확인
	@PostMapping("/login")
	public String login(Account account, HttpSession session) {
		
		//db에 있는지 확인
		Account loginAccount = loginService.loginCheck(account); 
		//로그인 성공
		if(loginAccount.getAccountId()==null) {
			return "redirect:/login";
			
		}
		session.setAttribute("loginId", loginAccount.getAccountId());
		session.setAttribute("loginLevel", loginAccount.getAccountLevel());
		//로그인 실패
		return null;
	}
}
