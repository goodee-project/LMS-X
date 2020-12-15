package gd.fintech.lms.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminIndexController {
	@GetMapping("/auth/admin/index")
	public String index(HttpSession session) {
		System.out.println(session.getAttribute("loginId"));
		System.out.println(session.getAttribute("loginLevel"));
		return "auth/admin/index";
	}
}
