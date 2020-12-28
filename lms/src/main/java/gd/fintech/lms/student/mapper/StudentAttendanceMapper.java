package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Attendance;

@Mapper
public interface StudentAttendanceMapper {
	// 학생의 한 강좌 출석 리스트 불러오기
	List<Attendance> selectAttendanceList(Map<String, Object> map);
}
