package gd.fintech.lms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Student;

@Mapper
public interface StudentManagementMapper {
	List<Student> selectStudentList();
}
