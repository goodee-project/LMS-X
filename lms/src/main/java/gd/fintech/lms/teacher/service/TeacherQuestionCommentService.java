package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherQuestionCommentMapper;
import gd.fintech.lms.vo.QuestionComment;

@Service
@Transactional
public class TeacherQuestionCommentService {
	@Autowired private TeacherQuestionCommentMapper teacherQuestionCommentMapper;
	
	//Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 댓글 리스트 출력
	// 질문 고유 번호(questionNo)
	public List<QuestionComment> getTeacherQuestionCommentListByPage(int questionNo, int beginRow, int rowPerPage) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("questionNo", questionNo);	// 질문 고유 번호
		map.put("beginRow", beginRow);		// 시작 데이터
		map.put("rowPerPage", rowPerPage);	// 한 페이지 당 표시할 데이터 수
		
		List<QuestionComment> teacherQuestionCommentList = teacherQuestionCommentMapper.selectTeacherQuestionCommentListByPage(map);
		
		//[Logger] 댓글 목록(teacherQuestionCommentList)
		logger.trace("teacherQuestionCommentList [" + teacherQuestionCommentList + "]");
		
		return teacherQuestionCommentList;
	}
	
	// 질문 게시판에 있는 댓글 개수 계산
	// 질문 고유 번호(questionNo) 사용
	public int getCountTeacherQuestionComment(int questionNo) {
		return teacherQuestionCommentMapper.selectQuestionCommentCount(questionNo);
	}
	
	// 질문 게시판에 있는 댓글 추가
	public int insertTeacherQuestionComment(QuestionComment questionComment) {
		return teacherQuestionCommentMapper.insertQuestionComment(questionComment);
	}
	
	// 질문 게시판에 있는 댓글 삭제
	// 댓글 고유 번호(questionCommentNo) 사용
	public int deleteTeacherQuestionComment(int questionCommentNo) {
		return teacherQuestionCommentMapper.deleteQuestionComment(questionCommentNo);
	}
	
	// 댓글 수정
	// QuestionComment 객체에 담긴 데이터 수정
	public void updateTeacherQuestionComment(QuestionComment questionComment) {
		teacherQuestionCommentMapper.updateTeacherQuestionComment(questionComment);
	}
	
	// 댓글 상세보기
	// 댓글 고유 번호(questionCommentNo) 사용
	public QuestionComment getTeacherQuestionCommentOne(int questionCommentNo) {
		return teacherQuestionCommentMapper.selecteTeacherQuestionCommentOne(questionCommentNo);
	}
}
