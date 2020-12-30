package gd.fintech.lms.manager.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.manager.service.ManagerMypageService;
import gd.fintech.lms.vo.Career;
import gd.fintech.lms.vo.License;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.ManagerForm;
import gd.fintech.lms.vo.MypageImage;

@Controller
public class ManagerMyageController {
	@Autowired private ManagerMypageService managerMypageService;
	
	private static final Logger log = LoggerFactory.getLogger(ManagerMyageController.class);
	
	// 운영자 마이페이지
	@GetMapping("/auth/manager/mypage/mypageOne")
	public String selectManagerMyPage(Model model, HttpSession session) {
		
		String accountId = (String)session.getAttribute("loginId");
		Manager manager = managerMypageService.selectManagerMypage(accountId);
		
		log.debug(manager.toString());
		
		//운영자 이미지 찾기
		MypageImage mypageImage = managerMypageService.selectManagerImage(accountId);
		if (mypageImage != null) {
			session.setAttribute("loginImage", mypageImage.getMypageImageUuid());
		}
		model.addAttribute("manager", manager);
		return "auth/manager/mypage/mypageOne";
	}
	
	// 운영자 마이페이지 수정
	@GetMapping("/auth/manager/mypage/updateMypage")
	public String updateMypage(Model model, HttpSession session) {
		String accountId = (String)session.getAttribute("loginId");
		Manager manager = managerMypageService.selectManagerMypage(accountId);
		
		model.addAttribute("manager", manager);
		return "auth/manager/mypage/updateMypage";
	}
	@PostMapping("/auth/manager/mypage/updateMypage")
	public String updateMypage(ManagerForm managerForm) {
		
		managerMypageService.updateManagerMypage(managerForm);
		return "redirect:/auth/manager/mypage/mypageOne";
	}
	
	// 운영자 마이페이지 경력및 자격증 수정페이지
	@GetMapping("/auth/manager/mypage/updateMypageCareerAndLicense") 
	public String updateMypageCareerAndLicense(Model model, HttpSession session) {
		String accountId = (String)session.getAttribute("loginId");
		Manager manager = managerMypageService.selectManagerMypage(accountId);
		
		model.addAttribute("manager", manager);
		return "auth/manager/mypage/updateMypageCareerAndLicense";
	}
	
	// 운영자 마이페이지 경력 삭제
	@GetMapping("/auth/manager/mypage/deleteMypageCareer/{careerNo}")
	public String deleteMypageCareer(HttpSession session, @PathVariable(name="careerNo") int careerNo) {
		String accountId = (String)session.getAttribute("loginId");
		
		managerMypageService.deleteManagerMypageCareer(careerNo, accountId);
		return "redirect:/auth/manager/mypage/updateMypageCareerAndLicense";
	}
	
	// 운영자 마이페이지 경력 추가
	@PostMapping("/auth/manager/mypage/insertMypageCareer")
	public String insertMypageCareer(Career career) {
		
		managerMypageService.insertManagerMypageCareer(career);
		return "redirect:/auth/manager/mypage/updateMypageCareerAndLicense";
	}
	
	// 운영자 마이페이지 자격증 추가
	@PostMapping("/auth/manager/mypage/insertMypageLicense")
	public String insertMypageLicense(License license) { 
		
		managerMypageService.insertManagerMypageLicense(license);
		
		return "redirect:/auth/manager/mypage/updateMypageCareerAndLicense";
		
	}
	// 운영자 마이페이지 자격증 삭제
	@GetMapping("/auth/manager/mypage/deleteMypageLicense/{licenseNo}")
	public String deleteMypageLicense(HttpSession session, @PathVariable(name="licenseNo") int licenseNo) { 
		
		String accountId = (String)session.getAttribute("loginId");
		managerMypageService.deleteManagerMypageLicense(licenseNo, accountId);
		
		return "redirect:/auth/manager/mypage/updateMypageCareerAndLicense";
	}
	
}
