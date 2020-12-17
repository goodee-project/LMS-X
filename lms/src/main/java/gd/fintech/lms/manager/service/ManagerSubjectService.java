package gd.fintech.lms.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerSubjectMapper;
import gd.fintech.lms.vo.Subject;

@Service
@Transactional
public class ManagerSubjectService {
	@Autowired ManagerSubjectMapper managerSubjectMapper;
	
	public List<Subject> getSubjectList() {
		return managerSubjectMapper.selectSubjectList();
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
	
	public Subject subjectOne(int subjectNo) {
		return managerSubjectMapper.subjectOne(subjectNo);
	}
}
