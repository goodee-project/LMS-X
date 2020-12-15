package gd.fintech.lms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Teacher;

@Mapper
public interface ManagerTeacherMapper {
	List<Teacher> selectTeacherList();
}
