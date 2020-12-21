package gd.fintech.lms.teacher.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.teacher.service.TeacherAttendanceService;
import gd.fintech.lms.vo.Attendance;

@Controller
public class TeacherAttendanceController {
	@Autowired private TeacherAttendanceService teacherAttendanceService;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 월별 출석 목록
	@GetMapping(value = "/auth/teacher/lecture/{lectureNo}/attendance/attendanceCalendarByMonth/{currentYear}/{currentMonth}")
	public String attendanceByMonth(Model model, 
			@PathVariable(name = "lectureNo") int lectureNo, 			// 강좌 고유번호
			@PathVariable(name = "currentYear") int currentYear, 		// 조회 년
			@PathVariable(name = "currentMonth") int currentMonth) {	// 조회 월
		// 오늘 날짜
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
		
		currentDay.set(Calendar.DATE, 1);								// 오늘 날짜 기준 일을 1로 바꾸어 이번 달 1일의 요일을 구한다.
		currentYear = currentDay.get(Calendar.YEAR);					// 올해 연도
		currentMonth = currentDay.get(Calendar.MONTH) + 1;				// Calendar.MONTH에 1을 더해야 실제 월이 나온다.
		int lastDay = currentDay.getActualMaximum(Calendar.DATE); 		// 월 마지막 날짜
		int firstDayOfWeek = currentDay.get(Calendar.DAY_OF_WEEK);		// 이번 달 1일의 요일
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("currentYear", currentYear);					// 년도
		model.addAttribute("currentMonth", currentMonth);				// 월
		model.addAttribute("lastDay", lastDay);							// 마지막 날
		model.addAttribute("firstDayOfWeek", firstDayOfWeek);			// 1일의 요일
		
		// [View] /auth/teacher/lecture/attendance/attendanceCalendarByMonth.jsp
		return "/auth/teacher/lecture/attendance/attendanceCalendarByMonth";
	}
	
	// 일별 출석 목록
	@GetMapping(value = "/auth/teacher/lecture/{lectureNo}/attendance/attendanceCalendarByDay/{target}/{currentYear}/{currentMonth}/{currentDay}")
	public String attendanceByDay(Model model, 
			@PathVariable(name = "lectureNo") int lectureNo, 							// 강좌 고유번호
			@PathVariable(name = "target") String target, 								// pre, next
			@PathVariable(name = "currentYear", required = true) int currentYear, 		// 현재 년
			@PathVariable(name = "currentMonth", required = true) int currentMonth, 	// 현재 월
			@PathVariable(name = "currentDay", required = true) int currentDay) {		// 현재 일
		Calendar targetDay = Calendar.getInstance();									// Calendar 객체를 이용해 오늘 날짜를 확인한다.
		targetDay.set(Calendar.YEAR, currentYear);
		targetDay.set(Calendar.MONTH, currentMonth - 1);
		targetDay.set(Calendar.DATE, currentDay);
		
		if (target.equals("pre")) {					// 이전 날짜 이동
			targetDay.add(Calendar.DATE, -1);
		} else if (target.equals("next")) {			// 다음 날짜 이동
			targetDay.add(Calendar.DATE, 1);
		}
		
		List<Attendance> attendanceList = teacherAttendanceService.getTeacherAttendanceListByDay(
				lectureNo, 
				targetDay.get(Calendar.YEAR), 
				targetDay.get(Calendar.MONTH) + 1, 
				targetDay.get(Calendar.DATE));
		
		// [Logger] 학생 출석 목록(attendanceList)
		logger.trace("attendanceList[" + attendanceList + "]");
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("attendanceList", attendanceList);
		
		model.addAttribute("currentYear", targetDay.get(Calendar.YEAR));			// 년도
		model.addAttribute("currentMonth", targetDay.get(Calendar.MONTH) + 1);		// 월
		model.addAttribute("currentDay", targetDay.get(Calendar.DATE));				// 일
		
		// [View] /auth/teacher/lecture/attendance/attendanceCalendarByDay.jsp
		return "/auth/teacher/lecture/attendance/attendanceCalendarByDay";
	}
	
	// 오늘 날짜 이동
	@GetMapping(value = "/auth/teacher/lecture/{lectureNo}/attendance/attendanceToday")
	String attencanceToday(@PathVariable(name = "lectureNo") int lectureNo) {
		Calendar targetDay = Calendar.getInstance();
		
		int currentYear = targetDay.get(Calendar.YEAR);
		int currentMonth = targetDay.get(Calendar.MONTH) + 1;
		int currentDay = targetDay.get(Calendar.DATE);
		
		// [Logger] 오늘 날짜(currentYear, currentMonth, currentDay)
		logger.trace("Today[" + currentYear + "." + currentMonth + "." + currentDay + "]");
		
		// [Redirect] 오늘 날짜의 일별 출석 목록으로 이동
		return "redirect:/auth/teacher/lecture/" + lectureNo + "/attendance/attendanceCalendarByDay/default/" + currentYear + "/" + currentMonth + "/" + currentDay;
	}
}