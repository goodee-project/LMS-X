package gd.fintech.lms.student.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.mapper.StudentReportMapper;
import gd.fintech.lms.vo.ClassRegistration;
import gd.fintech.lms.vo.Report;

@Service
public class StudentReportService {
	@Autowired StudentReportMapper studentReportMapper;
	
	// 강사가 출제한 과제 목록
	public ClassRegistration selectReportListByPage(Map<String, Object> map){
		return studentReportMapper.selectReportListByPage(map);
	}
	// 강사가 출제한 과제 개수
	public int selectStudentReportListEndPage(int classNo, int rowPerPage){
		int endPage = studentReportMapper.selectReportListCount(classNo);	
		
		if(endPage % rowPerPage == 0) {
			return endPage / rowPerPage;
		} else {
			return endPage / rowPerPage + 1;			
		}
	}
}
