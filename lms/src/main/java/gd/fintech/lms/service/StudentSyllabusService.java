package gd.fintech.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.mapper.StudentSyllabusMapper;
import gd.fintech.lms.vo.Syllabus;

//학생 강의계획서 서비스
@Service
@Transactional
public class StudentSyllabusService {
	@Autowired StudentSyllabusMapper studentSyllabusMapper;
	
	// 학생이 강의 계획서를 확인
	public Syllabus getStudentSyllabus(int lectureNo) {
		return studentSyllabusMapper.selectStudentSyllabusOne(lectureNo);
	}
}
