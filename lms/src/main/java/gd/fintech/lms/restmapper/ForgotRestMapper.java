package gd.fintech.lms.restmapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.Teacher;

@Mapper
public interface ForgotRestMapper {
	// 학생 정보 찾기
	public Student selectStudent(Student student);
	
	// 강사 정보 찾기
	public Teacher selectTeacher(Teacher teacher);
	
	// 운영자 정보 찾기
	public Manager selectManager(Manager manager);
}
