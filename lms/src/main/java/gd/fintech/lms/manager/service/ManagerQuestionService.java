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
	@Autowired ManagerQuestionMapper managerQuestionMapper;
	
	public List<Question> getQuestionListByPage(Map<String, Object> map) {
		return managerQuestionMapper.selectQuestionListByPage(map);
	}
	
	public int getCountQuestion(int rowPerPage) {
		return managerQuestionMapper.selectQuestionCount();
	}
	
	public int deleteQuestion(int questionNo) {
		return managerQuestionMapper.deleteQuestion(questionNo);
	}
	
	public Question getQuestionOne(int questionNo) {
		return managerQuestionMapper.selectQuestionOne(questionNo);
	}
	
	// 질문 게시판 상세보기 조회수 증가
	public int updateQuestionCountUp(int questionNo) {
		return managerQuestionMapper.updateQuestionCount(questionNo);
	}
}
