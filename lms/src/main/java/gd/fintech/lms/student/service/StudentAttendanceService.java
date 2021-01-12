package gd.fintech.lms.student.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.mapper.StudentAttendanceMapper;
import gd.fintech.lms.vo.Attendance;

@Service
@Transactional
public class StudentAttendanceService {
	@Autowired StudentAttendanceMapper studentAttendanceMapper;
	// 학생의 한 강좌 출석 리스트 불러오기
	public List<Attendance> selectAttendanceList(Map<String, Object> map){
		return studentAttendanceMapper.selectAttendanceList(map);
	}
	
	// 학생의 한 강좌 출석률
	public double selectAttendancePercent(Map<String, Object> map) {
		return studentAttendanceMapper.selectAttendancePercent(map);
	}
}
