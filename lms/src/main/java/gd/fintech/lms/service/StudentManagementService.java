package gd.fintech.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.mapper.StudentManagementMapper;
import gd.fintech.lms.vo.Student;

@Service
@Transactional
public class StudentManagementService {
	@Autowired StudentManagementMapper studentManagementMapper;
	
	public List<Student> getStudentList() {
		return studentManagementMapper.selectStudentList();
	}
}
