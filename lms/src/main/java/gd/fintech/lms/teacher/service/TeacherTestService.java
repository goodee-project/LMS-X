package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherTestMapper;
import gd.fintech.lms.vo.Answersheet;
import gd.fintech.lms.vo.Multiplechoice;
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
	
	// 평가 답안지 학생 목록
	public List<Answersheet> selectAnswersheetList(int lectureNo) {
		List<Answersheet> answersheetList = teacherTestMapper.selectAnswersheetList(lectureNo);
				
		return answersheetList;
	}
	
	// 객관식 문제 목록
	// 강좌 고유 번호(lectureNo), 시작 데이터 번호(beginRow), 페이지당 표시 데이터 수(rowPerPage)
	public List<Multiplechoice> selectMultiplechoiceList(int lectureNo, int beginRow, int rowPerPage) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("lectureNo", lectureNo);		// 강좌 고유번호
		map.put("beginRow", beginRow);			// 시작 데이터
		map.put("rowPerPage", rowPerPage);		// 한 페이지당 표시할 데이터 수
		
		List<Multiplechoice> multiplechoiceList = teacherTestMapper.selectMultiplechoiceList(map);
		
		// [Logger] 객관식 문제 목록(multiplechoiceList)
		logger.trace("multiplechoiceList[" + multiplechoiceList + "]");
		
		return multiplechoiceList;
	}
	
	// 객관식 문제 목록 카운트
	// 강좌 고유번호(lectureNo)
	public int selectMultiplechoiceListCount(int lectureNo) {
		return teacherTestMapper.selectMultiplechoiceListCount(lectureNo);
	}
	
	// 평가 학생 답안지 조회
	// 강좌 고유번호(lectureNo)
	public List<Multiplechoice> selectMultiplechoiceOne(int lectureNo) {
		List<Multiplechoice> multiplechoiceList = teacherTestMapper.selectMultiplechoiceOne(lectureNo);
		
		// [Logger] 객관식 문제 목록(multiplechoiceList)
		logger.trace("multiplechoiceList[" + multiplechoiceList + "]");
		
		return multiplechoiceList;
	}
}
