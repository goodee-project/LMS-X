package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.QuestionComment;

@Mapper
public interface TeacherQuestionCommentMapper {
	// 질문 댓글 리스트
	// 질문 고유 번호(questionNo), 시작데이터 번호(beginRow), 페이지 당 표시 페이지 수(rowPerPage)를 사용
	List<QuestionComment> selectTeacherQuestionCommentListByPage(Map<String, Integer> map);
	
	// 질문 댓글 수
	// 질문 고유 번호(questionNo)
	int selectQuestionCommentCount(int questionNo);
	
	// 질문 댓글 추가
	// 댓글(questionComment)객체에 데이터 저장
	int insertQuestionComment(QuestionComment questionComment);
	
	// 질문 댓글 삭제
	// 댓글 번호(questionCommentNo) 사용
	int deleteQuestionComment(int questionCommentNo);
	
	// 질문 댓글 수정
	// 댓글 객체에 있는 정보 사용
	int updateTeacherQuestionComment(QuestionComment questionComment);
	
	// 질문 댓글 상세 보기
	// 댓글 고유 번호 사용
	QuestionComment selecteTeacherQuestionCommentOne(int questionCommentNo);
}
