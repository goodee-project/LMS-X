package gd.fintech.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.mapper.StudentLectureMapper;
import gd.fintech.lms.vo.LectureAndClassRegistration;

// 학생 강좌 서비스
@Service
public class StudentLectureService {
	@Autowired StudentLectureMapper studentLectureMapper;
	
	// 학생 : 자신이 수강중인 강좌 목록
	public List<LectureAndClassRegistration> selectStudentClassListByPage(Map<String, Object> map){
		return studentLectureMapper.selectStudentClassListByPage(map);
	}
}
