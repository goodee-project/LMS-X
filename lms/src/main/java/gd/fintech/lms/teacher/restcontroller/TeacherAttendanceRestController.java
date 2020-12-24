package gd.fintech.lms.teacher.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.teacher.restservice.TeacherAttendanceRestService;

@RestController
public class TeacherAttendanceRestController {
	@Autowired TeacherAttendanceRestService teacherAttendanceRestService;
	
	// 학생 출석 상태 입력
	@GetMapping("/auth/teacher/lecture/{lectureNo}/attendance/insertAttendance/{currentYear}/{currentMonth}/{currentDay}/{accountId}")
	public void insertAttendance(@PathVariable(name = "lectureNo") int lectureNo, 						// 강좌 고유번호
			@PathVariable(name = "currentYear") int currentYear, 										// 년
			@PathVariable(name = "currentMonth") int currentMonth, 										// 월
			@PathVariable(name = "currentDay") int currentDay, 											// 일
			@PathVariable(name = "accountId") String accountId, 										// 학생 계정
			@RequestParam(value = "attendanceState") String attendanceState, 							// 출석 상태
			@RequestParam(value = "attendanceRemark", defaultValue = "") String attendanceRemark) {		// 출석 사유
		String attendanceDay = Integer.toString(currentYear) + "-" + Integer.toString(currentMonth) + "-" + Integer.toString(currentDay);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);					// 강좌 고유번호
		map.put("attendanceDay", attendanceDay);			// 년
		map.put("accountId", accountId);					// 학생 계정
		map.put("attendanceState", attendanceState);		// 출석 상태
		if (attendanceRemark.equals("")) {
			map.put("attendanceRemark", null);				// 출석 사유 (X)
		} else {
			map.put("attendanceRemark", attendanceRemark);	// 출석 사유 (O)
		}
		
		teacherAttendanceRestService.insertAttendance(map);
	}
	
	// 학생 출석 상태 변경
	@GetMapping("/auth/teacher/lecture/{lectureNo}/attendance/updateAttendance/{currentYear}/{currentMonth}/{currentDay}/{accountId}")
	public void updateAttendance(
			@PathVariable(name = "lectureNo") int lectureNo, 											// 강좌 고유번호
			@PathVariable(name = "currentYear") int currentYear, 										// 년
			@PathVariable(name = "currentMonth") int currentMonth, 										// 월
			@PathVariable(name = "currentDay") int currentDay, 											// 일
			@PathVariable(name = "accountId") String accountId, 										// 학생 계정
			@RequestParam(value = "attendanceState") String attendanceState, 							// 출석 상태
			@RequestParam(value = "attendanceRemark", defaultValue = "") String attendanceRemark) {		// 출석 사유
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);					// 강좌 고유번호
		map.put("currentYear", currentYear);				// 년
		map.put("currentMonth", currentMonth);				// 월
		map.put("currentDay", currentDay);					// 일
		map.put("accountId", accountId);					// 학생 계정
		map.put("attendanceState", attendanceState);		// 출석 상태
		if (attendanceRemark.equals("")) {
			map.put("attendanceRemark", null);				// 출석 사유 (X)
		} else {
			map.put("attendanceRemark", attendanceRemark);	// 출석 사유 (O)
		}
		
		teacherAttendanceRestService.updateAttendance(map);
	}
}
