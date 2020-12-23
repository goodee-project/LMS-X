package gd.fintech.lms.student.controller;

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
import org.springframework.web.bind.annotation.PostMapping;

import gd.fintech.lms.student.service.StudentNoteService;
import gd.fintech.lms.vo.Note;

@Controller
public class StudentNoteController {
	@Autowired StudentNoteService studentNoteService;
	
	// 쪽지 수신 목록
	@GetMapping("auth/student/note/noteReceiveList/{currentPage}")
	public String noteReceiveList(Model model, ServletRequest request,
			@PathVariable(name="currentPage") int currentPage) {

		int rowPerPage = 10; // 한페이지에 출력할 개수
		int beginRow = (currentPage - 1) * rowPerPage; // 시작 페이지
		
		HttpSession session = ((HttpServletRequest)request).getSession();	
		String accountId = (String)session.getAttribute("loginId");		
		
		int totalCount = studentNoteService.selectNoteReceiveListCount(accountId); // 게시글 총 개수

		// 마지막 페이지 구하기
		int lastPage = 0;
		
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		} else {
			lastPage = totalCount / rowPerPage + 1;			
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
		
		List<Note> noteList = studentNoteService.selectNoteReceiveListByPage(map);

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
		
		model.addAttribute("noteList", noteList);
		return "/auth/student/note/noteReceiveList";
	}

	// 쪽지 발신 목록
	@GetMapping("auth/student/note/noteDispatchList/{currentPage}")
	public String noteDispatchList(Model model, ServletRequest request,
			@PathVariable(name="currentPage") int currentPage) {

		int rowPerPage = 10; // 한페이지에 출력할 개수
		int beginRow = (currentPage - 1) * rowPerPage; // 시작 페이지
		
		HttpSession session = ((HttpServletRequest)request).getSession();	
		String accountId = (String)session.getAttribute("loginId");		
		
		int totalCount = studentNoteService.selectNoteDispatchListCount(accountId); // 게시글 총 개수

		// 마지막 페이지 구하기
		int lastPage = 0;
		
		if(totalCount % rowPerPage == 0) {
			lastPage = totalCount / rowPerPage;
		} else {
			lastPage = totalCount / rowPerPage + 1;			
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
		
		List<Note> noteList = studentNoteService.selectNoteDispatchListByPage(map);

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
		
		model.addAttribute("noteList", noteList);
		return "/auth/student/note/noteDispatchList";
	}
	
	// 쪽지 상세보기 - 수신함에서 
	@GetMapping("auth/student/note/noteReceiveOne/{noteNo}")
	public String noteReceiveOne(Model model,
			@PathVariable(name="noteNo") int noteNo) {
		
		Note note = studentNoteService.selectNoteReceiveOne(noteNo);
		
		model.addAttribute("note", note);
		
		return "/auth/student/note/noteOne";
	}
	
	// 쪽지 상세보기 - 발신함에서 
	@GetMapping("auth/student/note/noteDispatchOne/{noteNo}")
	public String noteDispatchOne(Model model,
			@PathVariable(name="noteNo") int noteNo) {
		
		Note note = studentNoteService.selectNoteDispatchOne(noteNo);
		
		model.addAttribute("note", note);
		
		return "/auth/student/note/noteOne";
	}
	
	// 쪽지 보내기 폼
	@GetMapping("auth/student/note/insertNote")
	public String insertNote() {
		return "/auth/student/note/insertNote";
	}
	
	// 쪽지 보내기 액션
	@PostMapping("auth/student/note/insertNote")
	public String insertNote(Note note, ServletRequest request) {

		HttpSession session = ((HttpServletRequest)request).getSession();	
		String accountId = (String)session.getAttribute("loginId");		
		String accountName = (String)session.getAttribute("loginName");
		
		note.setNoteDispatcherId(accountId);
		note.setNoteDispatcherName(accountName);
		
		studentNoteService.insertNote(note);
		return "redirect:/auth/student/note/noteDispatchList/1";
	}
}
