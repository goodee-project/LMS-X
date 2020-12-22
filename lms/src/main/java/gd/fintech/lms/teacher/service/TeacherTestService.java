package gd.fintech.lms.teacher.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherTestMapper;
import gd.fintech.lms.vo.Test;

@Service
@Transactional
public class TeacherTestService {
	@Autowired private TeacherTestMapper teacherTestMapper;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	// 시험 정보 조회
	public Test selectTestOne(int lectureNo) {
		Test test = teacherTestMapper.selectTestOne(lectureNo);
		
		// [Logger] 평가(test)
		logger.trace("test[" + test + "]");
		
		return test;
	}
	
	// 시험 정보 입력
	public void insertTest(Test test) {
		// [Logger] 평가(test)
		logger.trace("test[" + test + "]");
		
		teacherTestMapper.insertTest(test);
	}
	
	// 시험 정보 수정
	public void updateTest(Test test) {
		// [Logger] 평가(test)
		logger.trace("test[" + test + "]");
		
		teacherTestMapper.updateTest(test);
	}
}
