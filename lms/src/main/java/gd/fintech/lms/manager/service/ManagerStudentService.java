package gd.fintech.lms.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerStudentMapper;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.StudentQueue;

@Service
@Transactional
public class ManagerStudentService {
	@Autowired ManagerStudentMapper managerStudentMapper;
	
	public List<Map<String, Object>> getStudentListByPage(Map<String, Object> map) {
		return managerStudentMapper.selectStudentListByPage(map);
	}
	
	public int getCountStudent(int rowPerPage) {
		return managerStudentMapper.selectStudentCount();
	}
	
	public Student getStudentOne(String studentId) {
		return managerStudentMapper.selectStudentOne(studentId);
	}
	
	// 학생 승인 대기 목록
	public List<StudentQueue> getStudentQueueListByPage(Map<String, Object> map){
		return managerStudentMapper.selectStudentQueueListByPage(map);
	}
	
	// 학생 승인 대기 페이징
	public int getCountStudentQueue(int rowPerPage) {
		return managerStudentMapper.selectStudentQueueCount();
	}
}
