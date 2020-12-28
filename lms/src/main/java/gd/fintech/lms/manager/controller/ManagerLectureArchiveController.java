package gd.fintech.lms.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.manager.service.ManagerLectureArchiveService;
import gd.fintech.lms.vo.LectureArchive;

@Controller
public class ManagerLectureArchiveController {
	@Autowired ManagerLectureArchiveService managerLectureArchiveService;
	
	// 강좌 자료식 목록
	@GetMapping("auth/manager/lecture/{lectureNo}/archive/archiveList/{currentPage}")
	public String archiveList(Model model,
			@PathVariable(name="lectureNo") int lectureNo,
			@PathVariable(name="currentPage") int currentPage) {
		int rowPerPage = 10; // 한 페이지에 출력할 개수
		int totalCount = managerLectureArchiveService.selectLectureArchiveCount(lectureNo); // 마지막 페이지
		int beginRow = (currentPage - 1) * rowPerPage; // 시작 페이지
		int lastPage = 0;
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		} else {
			lastPage = totalCount / rowPerPage + 1;			
		}
		Map<String, Object> map = new HashMap<>(); // 자료실 목록 가져오기
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		map.put("lectureNo", lectureNo);
		List<LectureArchive> archiveList = managerLectureArchiveService.getLectureArchiveListByPage(map);
		
		int navPerPage = 10; // 네비에 출력될 페이지 개수
		
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1; // 네비의 첫 페이지
		
		int navLastPage = navFirstPage + navPerPage - 1; // 네비의 마지막 페이지
		
		// 현재 페이지가 10으로 나누어 떨어질 때
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
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		model.addAttribute("archiveList", archiveList);
		
		return "/auth/manager/lecture/archive/archiveList";
	}
	
	// 강좌 상세보기
	@GetMapping("/auth/manager/lecture/{lectureNo}/archive/archiveOne/{lectureArchiveNo}")
	public String archiveOne(Model model,
			@PathVariable(name="lectureNo") int lectureNo,
			@PathVariable(value = "lectureArchiveNo") int lectureArchiveNo) {
		managerLectureArchiveService.updateLectureArchiveCountUp(lectureArchiveNo);
		LectureArchive lectureArchive = managerLectureArchiveService.getLectureArchiveOne(lectureArchiveNo);
		model.addAttribute("lectureArchive", lectureArchive);
		return "auth/manager/lecture/archive/archiveOne";
	}
	
	// 자료 삭제
	@GetMapping("/auth/manager/lecture/{lectureNo}/archive/archiveOne/deleteArchive/{lectureArchiveNo}")
	public String deleteArchive(Model model, 
			@PathVariable(value = "lectureNo") int lectureNo, 						// 강의 번호
			@PathVariable(value = "lectureArchiveNo") int lectureArchiveNo) {		// 자료 번호
		managerLectureArchiveService.deleteManagerLectureArchive(lectureArchiveNo);
		
		return "redirect:/auth/manager/lecture/" + lectureNo + "/archive/archiveList/1";
	}
}
