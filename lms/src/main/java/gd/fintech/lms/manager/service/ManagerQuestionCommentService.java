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
	public List<QuestionComment> getManagerQuestionCommentListByPage(int questionNo, int beginRow, int rowPerPage) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("questionNo", questionNo);
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		List<QuestionComment> managerQuestionCommentList = managerQuestionCommentMapper.selectManagerQuestionCommentListByPage(map);
		
		return managerQuestionCommentList;
	}
	
	// 질문 게시판에 있는 댓글 개수 계산
	public int getManagerCountQuestionComment(int questionNo) {
		return managerQuestionCommentMapper.selectManagerQuestionCommentCount(questionNo);
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
