package gd.fintech.lms.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.manager.service.ManagerNoteService;
import gd.fintech.lms.vo.Note;

@Controller
public class ManagerNoteController {
	@Autowired ManagerNoteService managerNoteService;
	
	// 쪽지 수신 목록
	@GetMapping("auth/manager/note/noteReceiveList/{currentPage}")
	public String noteReceiveList(Model model, ServletRequest request,
			@PathVariable(value="currentPage") int currentPage) {
		// 한 페이지에 출력할 개수
		int rowPerPage = 10; 
		
		// 시작 페이지 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		
		HttpSession session = ((HttpServletRequest)request).getSession();	
		String accountId = (String)session.getAttribute("loginId");	
		
		int totalCount = managerNoteService.selectNoteReceiveListCount(accountId); // 게시글 총 개수
		
		// 마지막 페이지
		int lastPage = totalCount / rowPerPage;

		// 10 미만의 개수의 데이터가 있는 페이지 표시
		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		// 전체 페이지가 0개이면 현재 페이지도 0으로 표시
		if (lastPage == 0) {
			currentPage = 0;
		}
		
		// 쪽지 수신 목록 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		map.put("accountId", accountId);
		
		// 수신 목록
		List<Note> noteList = managerNoteService.selectNoteReceiveListByPage(map);
		
		// 내비게이션에 표시할 페이지 수
		int navPerPage = 10;

		// 내비게이션 첫 번째 페이지
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
		
		//model을 통해 View에 다음과 같은 정보들을 보내준다.
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		model.addAttribute("noteList", noteList);
		
		// [View] /auth/manger/note/noteReceiveList.jsp;
		return "auth/manager/note/noteReceiveList";
	}
}
