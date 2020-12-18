package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Student;

@Mapper
public interface ManagerStudentMapper {
	List<Student> selectStudentList();			// 학생 리스트
	int updateStudent(Student student);			// 학생 수정(계정 활성 권한 수정)
	Student selectStudentOne(int steudentNo);	// 학생 상세정보
}
