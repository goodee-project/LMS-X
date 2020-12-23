package gd.fintech.lms.student.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.mapper.StudentQnaCommentMapper;
import gd.fintech.lms.vo.QuestionComment;

@Service
@Transactional
public class StudentQnaCommentService {
	@Autowired private StudentQnaCommentMapper studentQnaCommentMapper;
	
	// 질문 게시판 댓글 리스트 목록 출력(페이징)
	public List<QuestionComment> getQnaCommentListByPage(Map<String, Object> map){
		return studentQnaCommentMapper.selectStudentQuestionCommentListByPage(map);
	}
	
	// 질문 게시판 댓글 수 확인
	public int getCountQnaCommentList(int questionNo) {
		return studentQnaCommentMapper.selectQnaCommentCount(questionNo);
	}
	
	// 질문 게시판 댓글 입력
	public void insertQnaComment(QuestionComment questionComment) {
		// 댓글 추가
		studentQnaCommentMapper.insertStudentQuestionComment(questionComment);
		return;
	}
	
	// 질문 게시판 댓글 수정
	public void updateQnaComment(QuestionComment questionComment) {
		studentQnaCommentMapper.updateStudentQuestionComment(questionComment);
		return;
	}
	
	// 질문 게시판 댓글 삭제
	public void deleteQnaComment(int questionCommentNo) {
		studentQnaCommentMapper.deleteStudentQuestionComment(questionCommentNo);
		return;
	}
}
