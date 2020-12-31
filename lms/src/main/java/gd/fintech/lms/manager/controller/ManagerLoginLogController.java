package gd.fintech.lms.manager.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.lms.manager.service.ManagerLoginLogService;
import gd.fintech.lms.vo.LoginLog;

@Controller
public class ManagerLoginLogController {
	@Autowired private ManagerLoginLogService managerLoginLogService;
	
	@GetMapping("/auth/manager/access/accessList/{currentPage}")
	public String managerLoginLogList(Model model, HttpSession session,
			@PathVariable(name="currentPage") int currentPage,
			@RequestParam(name="searchText", defaultValue = "") String searchText,
			@RequestParam(name="searchDate", defaultValue = "date") String searchDate) {
		
		
		// 오늘 날짜을 구하기 위한 코드
		Calendar logDay = Calendar.getInstance();
		
		int currentYear = logDay.get(Calendar.YEAR);		// 년
		int currentMonth = logDay.get(Calendar.MONTH) + 1;	// 월
		int currentDay = logDay.get(Calendar.DATE); 		// 일
		
		
		
		// View에서 오늘 날짜 로그 기록 출력을 위한 if 문	
		if (searchDate.equals("date")) {
			searchDate = currentYear + "-" + currentMonth + "-" + currentDay;
		}
		
		// 한 페이지에 표시할 데이터 수
		int rowPerPage = 10;
		
		// 시작 페이지 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		
		List<LoginLog> loginLogList = managerLoginLogService.getLoginLogList(beginRow, rowPerPage, searchText, searchDate);
		
		// 페이징 코드
		// 전체 데이터 수
		int totalCount = managerLoginLogService.getLoginLogCount(searchText, searchDate);
		
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
		
		model.addAttribute("loginLogList", loginLogList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		model.addAttribute("searchText", searchText);
		model.addAttribute("searchDate", searchDate);
		
		// [View] /auth/manager/access/accessList.jsp
		return "auth/manager/access/accessList";
	}
}
