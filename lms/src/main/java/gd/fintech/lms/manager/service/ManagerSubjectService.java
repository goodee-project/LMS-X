package gd.fintech.lms.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerSubjectMapper;
import gd.fintech.lms.vo.Subject;

@Service
@Transactional
public class ManagerSubjectService {
	@Autowired ManagerSubjectMapper managerSubjectMapper;
	
	public List<Subject> getSubjectList(Subject subject) {
		return managerSubjectMapper.selectSubjectList(subject);
	}
	
	public List<Subject> getSubjectListByPage(Map<String, Object> map) {
		return managerSubjectMapper.selectSubjectListByPage(map);
	}
	
	public int getCountSubject(int rowPerPage) {
		return managerSubjectMapper.selectSubjectCount();
	}
	
	public int insertSubject(Subject subject) {
		return managerSubjectMapper.insertSubject(subject);
	}
	
	public int deleteSubject(int subjectNo) {
		return managerSubjectMapper.deleteSubject(subjectNo);
	}
	
	public int updateSubject(Subject subject) {
		return managerSubjectMapper.updateSubject(subject);
	}
	
	public Subject getSubjectOne(int subjectNo) {
		return managerSubjectMapper.selectSubjectOne(subjectNo);
	}
}
