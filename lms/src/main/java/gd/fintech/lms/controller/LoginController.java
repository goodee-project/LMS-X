package gd.fintech.lms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.pathutil.LoginLogUtil;
import gd.fintech.lms.service.LoginService;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.LoginLog;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.Teacher;

@Controller
public class LoginController {
	@Autowired private LoginService loginService;
	
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);

	// 로그인 페이지 이동
	@GetMapping({"/","/login"})
	public String login(HttpSession session) {
		
		// 로그인이 되어 있으면
		if ( session.getAttribute("loginId") != null ) {
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
				return "redirect:/auth/admin/index/1";
			}
		}
		return "login";
	}
	//학생 로그인 페이지 이동
	@GetMapping("/studentLogin")
	public String studentLogin(HttpSession session) {
		if ( session.getAttribute("loginId") != null ) {
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
				return "redirect:/auth/admin/index/1";
			}
		}
		return "studentLogin";
	}
	//강사 로그인 페이지 이동
	@GetMapping("/teacherLogin")
	public String teacherLogin(HttpSession session) {
		if ( session.getAttribute("loginId") != null ) {
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
				return "redirect:/auth/admin/index/1";
			}
		}
		return "teacherLogin";
	}
	//운영자 로그인 페이지 이동
	@GetMapping("/managerLogin")
	public String managerLogin(HttpSession session) {
		if ( session.getAttribute("loginId") != null ) {
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
				return "redirect:/auth/admin/index/1";
			}
		}
		return "managerLogin";
	}
	//관리자 로그인 페이지 이동
	@GetMapping("/adminLogin")
	public String adminLogin(HttpSession session) {
		if ( session.getAttribute("loginId") != null ) {
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
				return "redirect:/auth/admin/index/1";
			}
		}
		return "adminLogin";
	}
	//로그인 시 확인
	@PostMapping("/login")
	public String login(Account account, HttpSession session, HttpServletRequest req) {
		
		//db에 있는지 확인
	
		Account loginAccount = loginService.getLoginCheck(account); 
		//로그인실패
		if ( loginAccount==null ) {
			return "redirect:/login";
		}
		
		//로그인 성공
		session.setAttribute("loginId", loginAccount.getAccountId());
		session.setAttribute("loginLevel", loginAccount.getAccountLevel());
		
		// 로그인 기록 생성
		LoginLog loginLog = new LoginLog();
		loginLog.setAccountId(loginAccount.getAccountId());
		loginLog.setLoginLogBrowser(LoginLogUtil.getClientBrowser(req));
		loginLog.setLoginLogIp(LoginLogUtil.getClientIp(req));
		loginLog.setLoginLogOs(LoginLogUtil.getClientOs(req));
		
		loginService.insertLoginLog(loginLog);
		
		if ( session.getAttribute("loginLevel").equals(1) ) {
			
			//session에 이름 추가
			Student student = loginService.getStudentName(loginAccount.getAccountId());
			session.setAttribute("loginName", student.getStudentName());
			
			return "redirect:/auth/student/index/1";
		} else if ( session.getAttribute("loginLevel").equals(2) ) {
			
			//session에 이름 추가
			Teacher teacher = loginService.getTeacherName(loginAccount.getAccountId());
			session.setAttribute("loginName", teacher.getTeacherName());
			
			return "redirect:/auth/teacher/index/1";
		} else if ( session.getAttribute("loginLevel").equals(3) ) {
			
			//session에 이름 추가
			Manager manager = loginService.getManagerName(loginAccount.getAccountId());
			session.setAttribute("loginName", manager.getManagerName());
		
			return "redirect:/auth/manager/index";
		} else {
			return "redirect:/auth/admin/index/1";
		}
	}
	//로그아웃
	@GetMapping("/auth/logout")
	public String logout(HttpSession session) {
		//System.out.println("로그아웃");
		log.debug("로그아웃");
		
		//session데이터 삭제
		session.invalidate(); 
		return "redirect:/login";
	}
}
