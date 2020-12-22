package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.QuestionComment;

@Mapper
public interface StudentQnaCommentMapper {
	
	// 질문 댓글 리스트 페이징
	List<QuestionComment> selectStudentQuestionCommentListByPage(Map<String, Object> map);
	
	// 질문 댓글 입력
	int insertStudentQuestionComment(QuestionComment questionComment);
	
	// 질문 댓글 삭제
	int deleteStudentQuestionComment(int questionCommentNo);
	
	// 질문 댓글 수정
	int updateStudentQuestionComment(QuestionComment questionComment);
	
	// 질문 댓글 수
	int selectQnaCommentCount();
}
