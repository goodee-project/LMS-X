package gd.fintech.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.mapper.StudentLectureMapper;
import gd.fintech.lms.vo.LectureAndClassRegistrationAndSubject;

// 학생 강좌 서비스
@Service
public class StudentLectureService {
	@Autowired StudentLectureMapper studentLectureMapper;
	
	// 학생 : 자신이 수강중인 강좌 목록
	public List<LectureAndClassRegistrationAndSubject> selectStudentClassListByPage(Map<String, Object> map){
		return studentLectureMapper.selectStudentClassListByPage(map);
	}
	// 자신이 수강중인 강좌 개수
	public int selectStudentClassListEndPage(String studentId, int rowPerPage) {
		int endPage = studentLectureMapper.selectStudentClassListCount(studentId);
		
		if(endPage % rowPerPage == 0) {
			return endPage / rowPerPage;
		} else {
			return endPage / rowPerPage + 1;			
		}
	}
}
