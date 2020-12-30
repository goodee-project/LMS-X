package gd.fintech.lms.restservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.restmapper.ForgotRestMapper;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.Teacher;

@Service
@Transactional
public class ForgotRestService {
	@Autowired private ForgotRestMapper forgotRestMapper;
	
	// 학생 정보 찾기 있으면 true , 없으면 false
	public String selectStudent(String email, String name, String phone) {
		Student student = new Student();
		student.setStudentEmail(email);
		student.setStudentName(name);
		student.setStudentPhone(phone);
		
		Student selectStudent = forgotRestMapper.selectStudent(student);
		String returnString = "false";
		if(selectStudent != null) {
			returnString = "ture";
		}
		
		return returnString;
	}
	
	// 강사 정보 찾기 있으면 true , 없으면 false
	public String selectTeacher(String email, String name, String phone) {
		Teacher teacher = new Teacher();
		teacher.setTeacherEmail(email);
		teacher.setTeacherName(name);
		teacher.setTeacherPhone(phone);
		
		Teacher selectTeacher = forgotRestMapper.selectTeacher(teacher);
		String returnString = "false";
		if(selectTeacher != null) {
			returnString = "ture";
		}
		
		return returnString;
	}
		
	// 운영자 정보 찾기 있으면 true , 없으면 false
	public String selectManager(String email, String name, String phone) {
		Manager manager = new Manager();
		manager.setManagerEmail(email);
		manager.setManagerName(name);
		manager.setManagerPhone(phone);
		
		Manager selectManager = forgotRestMapper.selectManager(manager);
		String returnString = "false";
		if(selectManager != null) {
			returnString = "ture";
		}
		
		return returnString;
	}	
}
