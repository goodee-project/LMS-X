package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.QuestionComment;

@Mapper
public interface TeacherQuestionCommentMapper {
	// 질문 댓글 리스트
	// 질문 고유 번호(questionNo), 시작데이터 번호(beginRow), 페이지 당 표시 페이지 수(rowPerPage)를 사용
	List<QuestionComment> selectTeacherQuestionCommentListByPage(Map<String, Object> map);
	
	// 질문 댓글 수
	// 질문 고유 번호(questionNo)
	int selectQuestionCommentCount(int questionNo);
}
