package gd.fintech.lms.controller;

import javax.servlet.http.HttpSession;

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
	//학생 로그인 페이지 이동
	@GetMapping("/studentLogin")
	public String studentLogin() {
		return "studentLogin";
	}
	//강사 로그인 페이지 이동
	@GetMapping("/teacherLogin")
	public String teacherLogin() {
		return "teacherLogin";
	}
	//운영자 로그인 페이지 이동
	@GetMapping("/managerLogin")
	public String managerLogin() {
		return "managerLogin";
	}
	//관리자 로그인 페이지 이동
	@GetMapping("/adminLogin")
	public String adminLogin() {
		return "adminLogin";
	}
	//로그인 시 확인
	@PostMapping("/login")
	public String login(Account account, HttpSession session) {
		
		//db에 있는지 확인
	
		Account loginAccount = loginService.loginCheck(account); 
		//로그인실패
		if(loginAccount==null) {
			return "redirect:/login";
		}
		//로그인 성공
		session.setAttribute("loginId", loginAccount.getAccountId());
		session.setAttribute("loginLevel", loginAccount.getAccountLevel());
		
		if(loginAccount.getAccountLevel()==1) {
			return "redirect:/auth/student/index";
		}else if(loginAccount.getAccountLevel()==2) {
			return "redirect:/auth/teacher/index";
		}else if(loginAccount.getAccountLevel()==3) {
			return "redirect:/auth/manager/index";
		}else {
			return "redirect:/auth/admin/index";
		}
	}
	//로그아웃
	@GetMapping("/auth/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃");
		session.invalidate(); //session데이터 삭제
		return "redirect:/login";
	}
}
