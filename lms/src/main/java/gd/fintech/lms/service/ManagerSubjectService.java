package gd.fintech.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.mapper.ManagerSubjectMapper;
import gd.fintech.lms.vo.Subject;

@Service
@Transactional
public class ManagerSubjectService {
	@Autowired ManagerSubjectMapper managerSubjectMapper;
	
	public List<Subject> getSubjectList() {
		return managerSubjectMapper.selectSubjectList();
	}
}
