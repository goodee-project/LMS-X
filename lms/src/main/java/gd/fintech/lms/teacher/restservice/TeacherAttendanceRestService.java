package gd.fintech.lms.teacher.restservice;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.teacher.restmapper.TeacherAttendanceRestMapper;

@Service
public class TeacherAttendanceRestService {
	@Autowired TeacherAttendanceRestMapper teacherAttendanceRestMapper;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	// 학생 출석 상태 입력
	public void insertAttendance(Map<String, Object> map) {
		teacherAttendanceRestMapper.insertAttendance(map);
	}
	
	// 학생 출석 상태 변경
	public void updateAttendance(Map<String, Object> map) {
		teacherAttendanceRestMapper.updateAttendance(map);
	}
}
