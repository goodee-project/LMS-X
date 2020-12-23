package gd.fintech.lms.manager.restcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.manager.restservice.ManagerMypageRestService;
import gd.fintech.lms.vo.Career;

@RestController
public class ManagerMypageRestController {
	@Autowired private ManagerMypageRestService managerMypageRestService;
	
	private static final Logger log = LoggerFactory.getLogger(ManagerMypageRestController.class);
	
	// 운영자 마이페이지 경력 정보검색
	@GetMapping("/auth/manager/mypage/selectCareer")
	public List<Career> selectCareer(HttpSession session){
		String accountId = (String)session.getAttribute("loginId");
		
		return  managerMypageRestService.getManagerMypageCareer(accountId);
	}
	// 운영자 마이페이지 경력 입력 
	@PostMapping("/auth/manager/mypage/selectCareer/{careerContent}/{careerStartdate}/{careerEnddate}")
	public String selectCareer(HttpSession session,
									@PathVariable(name="careerContent") String careerContent,
									@PathVariable(name="careerStartdate") String careerStartdate,
									@PathVariable(name="careerEnddate") String careerEnddate){
		
		Career career = new Career();
		career.setAccountId((String)session.getAttribute("loginId"));
		career.setCareerContent(careerContent);
		career.setCareerStartdate(careerStartdate);
		career.setCareerEnddate(careerEnddate);
		
		log.debug(career.toString());
		
		return "redirect:/auth/manager/mypage/selectCareer";
		//return managerMypageRestService.getManagerMypageCareer(career.getAccountId());
	}
	
	@PostMapping("/auth/manager/mypage/insertCareer")
	public String insertCareer(Career career) {
		
		return null;
	}
	
}
