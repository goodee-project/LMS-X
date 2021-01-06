package gd.fintech.lms.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerChartMapper;
import gd.fintech.lms.vo.Lecture;

@Service
@Transactional
public class ManagerChartService {
	@Autowired private ManagerChartMapper managerChartMapper;
	public List<Lecture> getLecture(){
		return managerChartMapper.selectLecture();
	}
}
