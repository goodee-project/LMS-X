package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Teacher;

@Mapper
public interface ManagerTeacherMapper {
	public List<Teacher> selectTeacherListByPage(Map<String, Object> map);	// 강사 리스트
	int selectTeacherCount();					// 강사 페이징 카운트
	Teacher selectTeacherOne(String teacherId);	// 강사 정보
}
