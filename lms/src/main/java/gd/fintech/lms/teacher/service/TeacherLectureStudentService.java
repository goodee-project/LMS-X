package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherLectureStudentMapper;
import gd.fintech.lms.vo.Attendance;
import gd.fintech.lms.vo.LectureAndStudentAndClassRegistration;

@Service
@Transactional
public class TeacherLectureStudentService {
	@Autowired TeacherLectureStudentMapper teacherLectureStudentMapper;
	
	public List<LectureAndStudentAndClassRegistration> selectTeacherLecutreStudentListByPage(Map<String, Object> map) {
		return teacherLectureStudentMapper.selectTeacherLectureStudentListByPage(map);
	}
	
	public LectureAndStudentAndClassRegistration getStudentOne(Map<String, Object> map) {
		return teacherLectureStudentMapper.selectTeacherLectureStudentOne(map);
	}
	
	public int getTeacherLectureStudentCount(Map<String, Object> map) {
		return teacherLectureStudentMapper.selectTeacherLectureStudentCount(map);
	}
	
	public List<Attendance> getTeacherAttendanceByStudentAndDay (int lectureNo, int currentYear, int currentMonth, int currentDay, String studentId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);			// 강좌 고유번호
		map.put("currentYear", currentYear);		// 현재 년도
		map.put("currentMonth", currentMonth);		// 현재 월
		map.put("currentDay", currentDay);			// 현재 일
		map.put("studentId", studentId);
		
		List<Attendance> attendanceList = teacherLectureStudentMapper.selectTeacherAttendanceByStudentAndDay(map);
		
		return attendanceList;
	}
	
	public List<Map<String, Object>> getTeacherAttendanceByStudentAndMonth (int lectureNo, int currentYear, int currentMonth, String accountId) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("lectureNo", lectureNo);			// 강좌 고유번호
		map.put("currentYear", currentYear);		// 현재 년도
		map.put("currentMonth", currentMonth);		// 현재 월
		map.put("accountId", accountId);			// 학생 아이디
		
		return teacherLectureStudentMapper.selectTeacherAttendanceByStudentAndMonth(map);
		
		 
	}
}
