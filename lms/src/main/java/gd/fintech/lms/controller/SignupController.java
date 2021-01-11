package gd.fintech.lms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.service.SignupService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.ManagerQueue;
import gd.fintech.lms.vo.StudentQueue;
import gd.fintech.lms.vo.TeacherQueue;

@Controller
public class SignupController {
	@Autowired private SignupService signupService;
	// 학생 회원가입
	@GetMapping("/student/signup")
	public String studentSignup(HttpSession session) {
		// 로그인일 때  접속 차단
		if ( session.getAttribute("loginId") != null ) {
			// session에 들어 있는 loginLevel에 따라 index페이지 이동
			if ( session.getAttribute("loginLevel").equals(1) ) {
				return "redirect:/auth/student/index/1";
			}
			if ( session.getAttribute("loginLevel").equals(2) ) {
				return "redirect:/auth/teacher/index/1";
			}
			if ( session.getAttribute("loginLevel").equals(3) ) {
				return "redirect:/auth/manager/index";
			}
			if ( session.getAttribute("loginLevel").equals(4) ) {
				return "redirect:/auth/admin/index";
			}
		}
		return "studentSignup";
	}
	@PostMapping("/student/signup")
	public String studentSignup(Account account, StudentQueue studentQueue) {
		// 학생 회원가입 
		// accountId를 가져와 studentQueue에 studentId에 값을 넣는다
		studentQueue.setStudentId(account.getAccountId()); 
		
		// 계정, 학생대기테이블 추가
		signupService.insertStudentAccount(account, studentQueue); 
		return "redirect:/login?member=student";
	}
	// 강사 회원가입
	@GetMapping("/teacher/signup")
	public String teacherSignup(HttpSession session) {
		// 로그인일 때  접속 차단
		if ( session.getAttribute("loginId") != null ) {
			// session에 들어 있는 loginLevel에 따라 index페이지 이동
			if ( session.getAttribute("loginLevel").equals(1) ) {
				return "redirect:/auth/student/index/1";
			}
			if ( session.getAttribute("loginLevel").equals(2) ) {
				return "redirect:/auth/teacher/index/1";
			}
			if ( session.getAttribute("loginLevel").equals(3) ) {
				return "redirect:/auth/manager/index";
			}
			if ( session.getAttribute("loginLevel").equals(4) ) {
				return "redirect:/auth/admin/index";
			}
		}
		return "teacherSignup";
	}
	@PostMapping("/teacher/signup")
	public String teacherSignUp(Account account, TeacherQueue teacherQueue) {
		// 강사 회원가입
		// accountId를 가져와 TeacherQueue에 teacherId에 값을 넣는다
		teacherQueue.setTeacherId(account.getAccountId());
		
		// 계정, 강사대기테이블 추가
		signupService.insertTeacherAccount(account, teacherQueue); 
		return "redirect:/login?member=teacher";
	}
	// 운영자 회원가입
	@GetMapping("/manager/signup")
	public String managerSignup(HttpSession session) {
		// 로그인일 때  접속 차단
		if ( session.getAttribute("loginId") != null ) {
			// session에 들어 있는 loginLevel에 따라 index페이지 이동
			if ( session.getAttribute("loginLevel").equals(1) ) {
				return "redirect:/auth/student/index/1";
			}
			if ( session.getAttribute("loginLevel").equals(2) ) {
				return "redirect:/auth/teacher/index/1";
			}
			if ( session.getAttribute("loginLevel").equals(3) ) {
				return "redirect:/auth/manager/index";
			}
			if ( session.getAttribute("loginLevel").equals(4) ) {
				return "redirect:/auth/admin/index";
			}
		}
		return "managerSignup";
	}
	@PostMapping("/manager/signup")
	public String managerSignup(Account account, ManagerQueue managerQueue) {
		// 운영자 회원가입
		// accountId를 가져와 managerQueue에 managerId에 값을 넣는다.
		managerQueue.setManagerId(account.getAccountId());
		
		// 계정, 운영자대기테이블 추가
		signupService.insertManagerAccount(account, managerQueue); 
		return "redirect:/login?member=manager";
	}
	
}
