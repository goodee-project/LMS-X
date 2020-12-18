package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherAttendanceMapper;
import gd.fintech.lms.vo.Attendance;

@Service
@Transactional
public class TeacherAttendanceService {
	@Autowired private TeacherAttendanceMapper teacherAttendanceMapper;
	
	public List<Attendance> getTeacherAttendanceListByDay(int lectureNo, int currentYear, int currentMonth, int currentDay) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);			// 강좌 고유번호
		map.put("currentYear", currentYear);		// 현재 년도
		map.put("currentMonth", currentMonth);		// 현재 월
		map.put("currentDay", currentDay);			// 현재 일
		
		return teacherAttendanceMapper.selectTeacherAttendanceListByDay(map);
	}
}
