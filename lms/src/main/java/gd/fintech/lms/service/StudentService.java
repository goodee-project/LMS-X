package gd.fintech.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.mapper.StudentMapper;
import gd.fintech.lms.vo.Student;

@Service
@Transactional
public class StudentService {
	@Autowired StudentMapper studentMapper;
	
	public List<Student> getStudentList() {
		return studentMapper.selectStudentList();
	}
}
