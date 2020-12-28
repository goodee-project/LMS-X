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

	@GetMapping(value="auth/student/lecture/{lectureNo}/attendance/attendanceByMonth/{target}/{currentYear}/{currentMonth}")
	public String cashbookByMonth(Model model, ServletRequest request,
			@PathVariable(name = "lectureNo") int lectureNo, 
			@PathVariable(name = "target") String target, 
			@PathVariable(name = "currentYear") int currentYear,
			@PathVariable(name = "currentMonth") int currentMonth) { 

		HttpSession session = ((HttpServletRequest)request).getSession();
		
		String accountId = (String)session.getAttribute("loginId");
		String accountName = (String)session.getAttribute("loginName");
		String accountImage = (String)session.getAttribute("loginImage");
		
		// 달력 생성
		Calendar currentDay = Calendar.getInstance(); // 2020년 11월 2일	
		
		// currentYear 넘어오고, currentMonth도 넘어면
	   if (currentYear != -1 && currentMonth != -1) {	
			currentDay.set(Calendar.YEAR, currentYear);
			currentDay.set(Calendar.MONTH , currentMonth -1);
			// 이전 선택 시
			if(target.equals("pre")) {
				currentDay.add(Calendar.MONTH, -1);
			// 다음 선택 시
			}else if (target.equals("next")) {
				currentDay.add(Calendar.MONTH, +1);		
			}
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
		model.addAttribute("accountName", accountName);
		model.addAttribute("accountImage", accountImage);
		
		return "auth/student/lecture/attendance/attendanceByMonth";
	}
	
}
