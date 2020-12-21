package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Attendance;

@Mapper
public interface TeacherAttendanceMapper {
	// 강사 출석 조회
	// 강좌 고유번호(lectureNo), 날짜(currentYear, currentMonth, currentDay)
	List<Attendance> selectTeacherAttendanceListByDay(Map<String, Object> map);
	
	// 강사 출석 수정
	// 출석 객체(Attendance)
	int updateTeacherAttendance(Attendance attendance);
}
