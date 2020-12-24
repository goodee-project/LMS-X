package gd.fintech.lms.teacher.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeacherAttendanceRestMapper {
	// 학생 출석 상태 입력
	int insertAttendance(Map<String, Object> map);
	
	// 학생 출석 상태 변경
	int updateAttendance(Map<String, Object> map);
}
