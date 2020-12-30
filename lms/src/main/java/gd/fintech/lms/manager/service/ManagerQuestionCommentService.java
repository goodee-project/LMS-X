package gd.fintech.lms.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerQuestionCommentMapper;
import gd.fintech.lms.vo.QuestionComment;

@Service
@Transactional
public class ManagerQuestionCommentService {
	@Autowired private ManagerQuestionCommentMapper managerQuestionCommentMapper;
	
	// 댓글 리스트 출력
	public List<QuestionComment> getManagerQuestionCommentList(int questionNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("questionNo", questionNo);	
		
		List<QuestionComment> managerQuestionCommentList = managerQuestionCommentMapper.selectManagerQuestionCommentList(map);
		
		return managerQuestionCommentList;
	}
	
	// 질문 게시판에 있는 댓글 삭제
	public int deleteManagerQuestionComment(int questionCommentNo) {
		return managerQuestionCommentMapper.deleteManagerQuestionComment(questionCommentNo);
	}
	
	// 댓글 상세보기
	public QuestionComment getManagerQuestionCommentOne(int questionCommentNo) {
		return managerQuestionCommentMapper.selectManagerQuestionCommentOne(questionCommentNo);
	}
}
