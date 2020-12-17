package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Attendance;

@Mapper
public interface TeacherAttendanceMapper {
	// 강사 출석관리 페이지에서 해당 날짜에 속해있는 출석 목록을 출력
	// 강좌 고유번호(lectureNo), 날짜(currentYear, currentMonth, currentDay) 이용
	List<Attendance> selectTeacherAttendanceListByDay(Map<String, Object> map);
	
	// 출석 정보 수정
	// Attendance 객체에 담겨있는 정보를 이용
	int updateTeacherAttendance(Attendance attendance);
}
