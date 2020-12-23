package gd.fintech.lms.teacher.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.teacher.service.TeacherMypageService;
import gd.fintech.lms.vo.Career;
import gd.fintech.lms.vo.License;
import gd.fintech.lms.vo.Teacher;

@Controller
public class TeacherMypageController {
@Autowired private TeacherMypageService teacherMypageService;
	
	
	private static final Logger log = LoggerFactory.getLogger(TeacherMypageController.class);

	// 운영자 마이페이지
	@GetMapping("/auth/teacher/mypage/mypageOne")
	public String selectTeacherMyPage(Model model, HttpSession session) {
		
		String accountId = (String)session.getAttribute("loginId");
		Teacher teacher = teacherMypageService.selectTeacherMypage(accountId);
		log.debug(teacher.toString());
		
		model.addAttribute("teacher", teacher);
		return "auth/teacher/mypage/mypageOne";
	}
	
	// 운영자 마이페이지 수정
	@GetMapping("/auth/teacher/mypage/updateMypage")
	public String updateMypage(Model model, HttpSession session) {
		String accountId = (String)session.getAttribute("loginId");
		Teacher teacher = teacherMypageService.selectTeacherMypage(accountId);
		
		model.addAttribute("teacher",teacher);
		return "auth/teacher/mypage/updateMypage";
	}
	@PostMapping("/auth/Teacher/mypage/updateMypage")
	public String updateMypage(Teacher teacher) {
		
		teacherMypageService.updateTeacherMypage(teacher);
		return "redirect:/auth/teacher/mypage/mypageOne";
	}
	
	// 운영자 마이페이지 경력및 자격증 수정페이지
	@GetMapping("/auth/teacher/mypage/updateMypageCareerAndLicense") 
	public String updateMypageCareerAndLicense(Model model, HttpSession session) {
		String accountId = (String)session.getAttribute("loginId");
		Teacher teacher = teacherMypageService.selectTeacherMypage(accountId);
		
		model.addAttribute("teacher",teacher);
		
		return "auth/Teacher/mypage/updateMypageCareerAndLicense";
	}
	
	// 운영자 마이페이지 경력 삭제
	@GetMapping("/auth/teacher/mypage/deleteMypageCareer/{careerNo}")
	public String deleteMypageCareer(HttpSession session, @PathVariable(name="careerNo") int careerNo) {
		String accountId = (String)session.getAttribute("loginId");
		
		teacherMypageService.deleteTeacherMypageCareer(careerNo, accountId);
		return "redirect:/auth/teacher/mypage/updateMypageCareerAndLicense";
	}
	
	// 운영자 마이페이지 경력 추가
	@PostMapping("/auth/teacher/mypage/insertMypageCareer")
	public String insertMypageCareer(Career career) {
		
		teacherMypageService.insertTeacherMypageCareer(career);
		return "redirect:/auth/teacher/mypage/updateMypageCareerAndLicense";
	}
	
	// 운영자 마이페이지 자격증 추가
	@PostMapping("/auth/teacher/mypage/insertMypageLicense")
	public String insertMypageLicense(License license) { 
		
		teacherMypageService.insertTeacherMypageLicense(license);
		
		return "redirect:/auth/teacher/mypage/updateMypageCareerAndLicense";
		
	}
	// 운영자 마이페이지 자격증 삭제
	@GetMapping("/auth/teacher/mypage/deleteMypageLicense/{licenseNo}")
	public String deleteMypageLicense(HttpSession session, @PathVariable(name="licenseNo") int licenseNo) { 
		
		String accountId = (String)session.getAttribute("loginId");
		teacherMypageService.deleteTeacherMypageLicense(licenseNo, accountId);
		
		return "redirect:/auth/teacher/mypage/updateMypageCareerAndLicense";
	}
}
