package gd.fintech.lms.manager.service;

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
	
	// 질문 게시판 목록
	public List<Question> getManagerQuestionListByPage(Map<String, Object> map) {
		return managerQuestionMapper.selectManagerQuestionListByPage(map);
	}
	
	// 질문 게시판 페이징 카운팅
	public int getManagerCountQuestion(int rowPerPage) {
		return managerQuestionMapper.selectManagerQuestionCount();
	}
	
	// 질문 게시판 삭제
	public int deleteManagerQuestion(int questionNo) {
		return managerQuestionMapper.deleteManagerQuestion(questionNo);
	}
	
	// 질문 게시판 상세보기
	public List<Question> getManagerQuestionOne(int questionNo) {
		List<Question> questionOne = managerQuestionMapper.selectManagerQuestionOne(questionNo);
		return questionOne;
	}
	
	// 질문 게시판 상세보기 조회수 증가
	public int updateManagerQuestionCountUp(int questionNo) {
		return managerQuestionMapper.updateManagerQuestionCount(questionNo);
	}
}
