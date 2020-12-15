package gd.fintech.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.mapper.ManagerTeacherMapper;
import gd.fintech.lms.vo.Teacher;

@Service
@Transactional
public class ManagerTeacherService {
	@Autowired ManagerTeacherMapper managerTeacherMapper;
	
	public List<Teacher> getTeacherList() {
		return managerTeacherMapper.selectTeacherList();
	}
}
