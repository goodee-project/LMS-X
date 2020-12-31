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
import gd.fintech.lms.vo.MultiplechoiceExample;
import gd.fintech.lms.vo.MultiplechoiceForm;
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
	
	// 객관식 문제 보기
	public Multiplechoice selectMultiplechoiceExampleList(int multiplechoiceNo){
		return teacherTestMapper.selectMultiplechoiceExampleList(multiplechoiceNo);
	}
	
	// 객관식 문제 수정
	public void updateMultiplechoiceExampleList(MultiplechoiceForm multiplechoiceForm) {
		Multiplechoice multiplechoice = new Multiplechoice();
		MultiplechoiceExample multiplechoiceExample = new MultiplechoiceExample();
		// 객관식 문제 수정
		multiplechoice.setMultiplechoiceNo(multiplechoiceForm.getMultiplechoiceNo());
		multiplechoice.setMultiplechoiceQuestion(multiplechoiceForm.getMultiplechoiceQuestion());
		multiplechoice.setMultiplechoiceAnswer(multiplechoiceForm.getMultiplechoiceAnswer());
		multiplechoice.setMultiplechoiceScore(multiplechoiceForm.getMultiplechoiceScore());
		
		teacherTestMapper.updateMultiplechoice(multiplechoice);
		
		// 객관식 문제 보기 수정
		multiplechoiceExample.setMultiplechoiceNo(multiplechoiceExample.getMultiplechoiceNo());
		for(int i = 0; i < 5; i++) {
			multiplechoiceExample.setMultiplechoiceExampleId(multiplechoiceForm.getMultiplechoiceExampleId().get(i));
			multiplechoiceExample.setMultiplechoiceExampleContent(multiplechoiceForm.getMultiplechoiceExampleContent().get(i));

			teacherTestMapper.updateMultiplechoiceExample(multiplechoiceExample);
		}
		
	}
	
	// 객관식 문제 추가
	public void insertMultiplechoice(MultiplechoiceForm multiplechoiceForm) {
		Multiplechoice multiplechoice = new Multiplechoice();
		MultiplechoiceExample multiplechoiceExample = new MultiplechoiceExample();
		// 객관식 문제 추가
		multiplechoice.setMultiplechoiceNo(multiplechoiceForm.getMultiplechoiceNo());
		multiplechoice.setMultiplechoiceQuestion(multiplechoiceForm.getMultiplechoiceQuestion());
		multiplechoice.setMultiplechoiceAnswer(multiplechoiceForm.getMultiplechoiceAnswer());
		multiplechoice.setMultiplechoiceScore(multiplechoiceForm.getMultiplechoiceScore());
		multiplechoice.setLectureNo(multiplechoiceForm.getLectureNo());
		// 객관식 문제 번호 자동으로 추가
		multiplechoice.setMultiplechoiceId(teacherTestMapper.selectMultiplechoiceListCount(multiplechoiceForm.getLectureNo()) + 1);
		teacherTestMapper.insertMultiplechoice(multiplechoice);
		
		// 객관식 문제 보기 수정
		multiplechoiceExample.setMultiplechoiceNo(multiplechoice.getMultiplechoiceNo());
		for(int i = 0; i < 5; i++) {
			multiplechoiceExample.setMultiplechoiceExampleId(multiplechoiceForm.getMultiplechoiceExampleId().get(i));
			multiplechoiceExample.setMultiplechoiceExampleContent(multiplechoiceForm.getMultiplechoiceExampleContent().get(i));

			teacherTestMapper.insertMultiplechoiceExample(multiplechoiceExample);
		}
		
	}
	
	// 객관식 문제 삭제
	public void deleteMultiplechoice(int multiplechoiceNo, int lectureNo) {
		teacherTestMapper.deleteAnswersheetList(multiplechoiceNo);
		teacherTestMapper.deleteMultiplechoiceExample(multiplechoiceNo);
		teacherTestMapper.deleteMultiplechoice(multiplechoiceNo);
		
		// 남은 객관식 문제들의 번호를 가져옴
		List<Integer> multiplechoiceIdList = teacherTestMapper.selectMultiplechoiceIdList(lectureNo);
		
		// 객관식 문제 하나를 삭제하면 그에 맞게 남은 객관식 문제들의 id(번호)를 순서에 맞게 다시 정렬해줘야함.
		int newId = 0;	// 새로운 id
		for(int oldId : multiplechoiceIdList) {
			newId++;
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("oldId", oldId);	// 이전 id
			map.put("newId", newId);	// 새로운 id
			map.put("lectureNo", lectureNo);
			
			teacherTestMapper.updateMultiplechoiceId(map);
		}
		
	}
	
}
