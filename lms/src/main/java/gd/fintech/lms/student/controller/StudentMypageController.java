package gd.fintech.lms.student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.student.service.StudentMypageService;
import gd.fintech.lms.vo.License;
import gd.fintech.lms.vo.MypageImage;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.StudentForm;

@Controller
public class StudentMypageController {
	@Autowired private StudentMypageService studentMypageService;
		
	private static final Logger log = LoggerFactory.getLogger(StudentMypageController.class);

	// 학생 마이페이지
	@GetMapping("/auth/student/mypage/mypageOne")
	public String selectstudentMyPage(Model model, HttpSession session) {
		
		String accountId = (String)session.getAttribute("loginId");
		Student student = studentMypageService.selectstudentMypage(accountId);
		
		log.debug(student.toString());
		
		MypageImage mypageImage = studentMypageService.selectManagerImage(accountId);
		if (mypageImage != null) {
			session.setAttribute("loginImage", mypageImage.getMypageImageUuid());
		}
		model.addAttribute("student", student);
		return "auth/student/mypage/mypageOne";
	}
	
	// 학생 마이페이지 수정
	@GetMapping("/auth/student/mypage/updateMypage")
	public String updateMypage(Model model, HttpSession session) {
		String accountId = (String)session.getAttribute("loginId");
		Student student = studentMypageService.selectstudentMypage(accountId);
		
		model.addAttribute("student", student);
		return "auth/student/mypage/updateMypage";
	}
	@PostMapping("/auth/student/mypage/updateMypage")
	public String updateMypage(StudentForm studentForm, HttpServletRequest request) {
		
		log.debug(studentForm.toString());
		
		studentMypageService.updatestudentMypage(studentForm, request);
		return "redirect:/auth/student/mypage/mypageOne";
	}
	
	// 학생 마이페이지 경력및 자격증 수정페이지
	@GetMapping("/auth/student/mypage/updateMypageCareerAndLicense") 
	public String updateMypageCareerAndLicense(Model model, HttpSession session) {
		String accountId = (String)session.getAttribute("loginId");
		Student student = studentMypageService.selectstudentMypage(accountId);
		
		model.addAttribute("student",student);
		return "auth/student/mypage/updateMypageCareerAndLicense";
	}
	
	// 학생 마이페이지 자격증 추가
	@PostMapping("/auth/student/mypage/insertMypageLicense")
	public String insertMypageLicense(License license) { 
		
		studentMypageService.insertStudentMypageLicense(license);
		
		return "redirect:/auth/student/mypage/updateMypageCareerAndLicense";
	}
	
	// 학생 마이페이지 자격증 삭제
	@GetMapping("/auth/student/mypage/deleteMypageLicense/{licenseNo}")
	public String deleteMypageLicense(HttpSession session, @PathVariable(name="licenseNo") int licenseNo) { 
		
		String accountId = (String)session.getAttribute("loginId");
		studentMypageService.deleteStudentMypageLicense(licenseNo, accountId);
		
		return "redirect:/auth/student/mypage/updateMypageCareerAndLicense";
	}
}
