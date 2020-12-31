package gd.fintech.lms.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerQuestionMapper;
import gd.fintech.lms.vo.Question;

@Service
@Transactional
public class ManagerQuestionService {
	@Autowired private ManagerQuestionMapper managerQuestionMapper;
	
	// 강의에 대한 질문 게시판 목록
	public List<Question> getManagerQuestionListByPage(int lectureNo, int beginRow, int rowPerPage) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("lectureNo", lectureNo);	//강의실 고유 번호
		map.put("beginRow", beginRow);		//시작 데이터
		map.put("rowPerPage", rowPerPage);	// 한 페이지 당 표시할 데이터 수
		
		List<Question> managerQuestionList = managerQuestionMapper.selectManagerQuestionListByPage(map);
		
		return managerQuestionList;
	}
	
	// 질문 게시판 페이징 카운팅
	public int getManagerCountQuestion(int lectureNo) {
		return managerQuestionMapper.selectManagerQuestionCount(lectureNo);
	}
	
	// 질문 게시판 삭제
	public int deleteManagerQuestion(int questionNo) {
		return managerQuestionMapper.deleteManagerQuestion(questionNo);
	}
	
	// 질문 게시판 상세보기
	public Question getManagerQuestionOne(int questionNo) {
		Question questionOne = managerQuestionMapper.selectManagerQuestionOne(questionNo);
		return questionOne;
	}
	
	// 질문 게시판 상세보기 조회수 증가
	public int updateManagerQuestionCountUp(int questionNo) {
		return managerQuestionMapper.updateManagerQuestionCount(questionNo);
	}
}
