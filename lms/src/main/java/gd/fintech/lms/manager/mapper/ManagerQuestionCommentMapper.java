package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.QuestionComment;

@Mapper
public interface ManagerQuestionCommentMapper {
	// 질문 댓글 리스트
	List<QuestionComment> selectManagerQuestionCommentList(Map<String, Integer> map);
	
	// 질문 댓글 삭제
	int deleteManagerQuestionComment(int questionCommentNo);
	
	// 질문 댓글 상세 보기
	QuestionComment selectManagerQuestionCommentOne(int questionCommentNo);
}
