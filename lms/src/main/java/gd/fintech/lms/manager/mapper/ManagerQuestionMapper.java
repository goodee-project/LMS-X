package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Question;

@Mapper
public interface ManagerQuestionMapper {
	public List<Question> selectQuestionListByPage(Map<String, Object> map); // 질문 리스트
	int selectQuestionCount();					// 질문 페이징 카운트
	int deleteQuestion(int question);			// 질문 삭제
	Question selectQuestionOne(int question);   // 질문 상세보기
}
