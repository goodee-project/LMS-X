package gd.fintech.lms.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerTeacherMapper;
import gd.fintech.lms.vo.Teacher;

@Service
@Transactional
public class ManagerTeacherService {
	@Autowired ManagerTeacherMapper managerTeacherMapper;
	
	public List<Teacher> getTeacherListByPage(Map<String, Object> map) {
		return managerTeacherMapper.selectTeacherListByPage(map);
	}
	
	public int getCountTeacher(int rowPerPage) {
		return managerTeacherMapper.selectTeacherCount();
	}
	
	public Teacher getTeacherOne(String teacherId) {
		return managerTeacherMapper.selectTeacherOne(teacherId);
	}
}
