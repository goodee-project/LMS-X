package gd.fintech.lms.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerStudentMapper;
import gd.fintech.lms.vo.Student;

@Service
@Transactional
public class ManagerStudentService {
	@Autowired ManagerStudentMapper managerStudentMapper;
	
	public List<Student> getStudentList() {
		return managerStudentMapper.selectStudentList();
	}
}
