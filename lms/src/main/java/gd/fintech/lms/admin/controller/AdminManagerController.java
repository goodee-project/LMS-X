package gd.fintech.lms.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.admin.service.AdminManagerService;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.ManagerQueue;
import gd.fintech.lms.vo.MypageImage;

@Controller
public class AdminManagerController {
	@Autowired private AdminManagerService adminManagerService;
		
	private static final Logger log = LoggerFactory.getLogger(AdminManagerController.class);

	// 운영자 승인대기 출력
	@GetMapping("/auth/admin/managerQueue/{currentPage}")
	public String managerAccessQueueList(Model model, @PathVariable(name="currentPage") int currentPage){
		log.debug("managerAccessQueueList 접속 성공");
		
		// 한 페이지에 표시할 데이터 수
				int rowPerPage = 10;
				
				// 시작 페이지 계산
				int beginRow = (currentPage - 1) * rowPerPage;
				
				// 운영자 리스트 출력
		List<ManagerQueue> managerQueueList = adminManagerService.getManagerQueueList(beginRow, rowPerPage); 
		
		// 페이징 코드
		// 전체 데이터 수
		int totalCount = adminManagerService.getManagerQueueCount();
		
		int lastPage = totalCount / rowPerPage;
		
		// 10 미만의 개수의 데이터가 있는 페이지를 표시
		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		
		// 전체 페이지가 0개이면 현재 페이지도 0으로 표시
		if (lastPage == 0) {
			currentPage = 0;
		}
		
		// 내비게이션에 표시할 페이지 수
		int navPerPage = 10;
		
		// 내비게이션 첫번째 페이지
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;	
		
		// 내비게이션 마지막 페이지
		int navLastPage = navFirstPage + navPerPage - 1;
		
		// 10으로 나누어 떨어지는 경우 처리하는 코드
		if (currentPage % navPerPage == 0 && currentPage != 0) {
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
		
		// 현재 페이지에 대한 이전 페이지
		int prePage;
		if (currentPage > 10) {
			prePage = currentPage - (currentPage % navPerPage) + 1 - 10;
		} else {
			prePage = 1;
		}
		
		// 현재 페이지에 대한 다음 페이지
		int nextPage = currentPage - (currentPage % navPerPage) + 1 + 10;
		if (nextPage > lastPage) {
			nextPage = lastPage;
		}
		model.addAttribute("managerQueueList",managerQueueList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		return "auth/admin/manager/managerQueueList";
	}
	
	// 운영자 승인 거절
	@GetMapping("/auth/admin/negativeManager/{currentPage}/{accountId}")
	public String negativeManager(@PathVariable(name="currentPage") String currentPage,
								  @PathVariable(name="accountId") String accountId){
		
		adminManagerService.negativeManager(accountId);
		return "redirect:/auth/admin/managerQueue/"+currentPage;
	}
	// 운영자 승인
	@GetMapping("/auth/admin/accessManager/{currentPage}/{accountId}")
	public String accessManager(@PathVariable(name="currentPage") String currentPage, 
								@PathVariable(name="accountId") String accountId){
		
		adminManagerService.accessManager(accountId);
		return "redirect:/auth/admin/managerQueue/"+currentPage;
	}
	
	// 운영자 상세보기
	@GetMapping("/auth/admin/managerOne/{managerId}")
	public String selectManagerOne(Model model, @PathVariable(name="managerId") String managerId) {
		
		Manager manager = adminManagerService.getManagerOne(managerId);
		MypageImage mypageImage = adminManagerService.getManagerImage(managerId);
		System.out.println(mypageImage);
		String managerImage = null;
		if (mypageImage == null) {
			managerImage = "default.png";
		} else {
			managerImage = mypageImage.getMypageImageUuid();
		}
		
		model.addAttribute("manager", manager);
		model.addAttribute("managerImage", managerImage);
		return "/auth/admin/manager/managerOne";
	}
	
	// 운영자 직급 수정
	@PostMapping("/auth/admin/updatePosition/{managerId}")
	public String updatePosition(Manager manager,
								@PathVariable(name="managerId") String managerId) {
		
		manager.setManagerId(managerId);
		adminManagerService.updateManagerPosition(manager);
		
		return "redirect:/auth/admin/managerOne/"+managerId;
	}
	
	// 운영자 탈퇴
	@GetMapping("/auth/admin/deleteManager/{currentPage}/{managerId}")
	public String deleteManager(@PathVariable(name="currentPage") String currentPage,
								@PathVariable(name="managerId") String managerId,
								Manager manager) {
		
		adminManagerService.deleteManagerAll(managerId);
		return "redirect:/auth/admin/index/"+currentPage+"?managerPosition="+manager.getManagerPosition()+"&"+"managerName="+manager.getManagerName();
	}
}	
