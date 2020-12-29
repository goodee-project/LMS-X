package gd.fintech.lms.student.controller;

import java.util.Calendar;
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

import gd.fintech.lms.student.service.StudentAttendanceService;
import gd.fintech.lms.vo.Attendance;

@Controller
public class StudentAttendanceController {
	@Autowired StudentAttendanceService studentAttendanceService;

	@GetMapping(value="auth/student/lecture/{lectureNo}/attendance/attendanceByMonth/{currentYear}/{currentMonth}")
	public String cashbookByMonth(Model model, ServletRequest request,
			@PathVariable(name = "lectureNo") int lectureNo, 
			@PathVariable(name = "currentYear") int currentYear,
			@PathVariable(name = "currentMonth") int currentMonth) { 

		HttpSession session = ((HttpServletRequest)request).getSession();
		
		String accountId = (String)session.getAttribute("loginId");

		// 현재 날짜
		Calendar currentDay = Calendar.getInstance();

		// currentYear와 currentMonth의 값이 모두 넘어왔을 경우
		if (currentYear != -1 && currentMonth != -1) {
			if (currentMonth == 0) {
				currentYear -= 1;
				currentMonth = 12;
			}
			
			if (currentMonth == 13) {
				currentYear += 1;
				currentMonth = 1;
			}
			
			currentDay.set(Calendar.YEAR, currentYear);
			
			// Calendar 함수의 값 보정 위해 1만큼 감안하여 설정
			currentDay.set(Calendar.MONTH, currentMonth - 1);
		}

		currentDay.set(Calendar.DATE, 1); // 2020년 11월 1일
		
		int lastDay = currentDay.getActualMaximum(Calendar.DATE);
		int firstDayOfWeek = currentDay.get(Calendar.DAY_OF_WEEK);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);
		map.put("accountId", accountId);
		map.put("currentYear", currentDay.get(Calendar.YEAR));
		map.put("currentMonth", currentDay.get(Calendar.MONTH) + 1);
		 
		// 해당 달의 출석 리스트
		List<Attendance> attendanceList = studentAttendanceService.selectAttendanceList(map);
		
		// 뷰 연결
		model.addAttribute("currentYear", currentDay.get(Calendar.YEAR)); 
		model.addAttribute("currentMonth", currentDay.get(Calendar.MONTH) + 1); 
		model.addAttribute("lastDay", lastDay);
		model.addAttribute("firstDayOfWeek", firstDayOfWeek);
		model.addAttribute("attendanceList", attendanceList);
		model.addAttribute("accountId", accountId);
		
		return "auth/student/lecture/attendance/attendanceByMonth";
	}
	
}
