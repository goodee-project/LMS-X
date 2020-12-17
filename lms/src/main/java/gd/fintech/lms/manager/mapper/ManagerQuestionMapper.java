package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Question;

@Mapper
public interface ManagerQuestionMapper {
	List<Question> selectQuestionList(); // 질문 리스트 
	int deleteQuestion(int question);	 // 질문 삭제
	Question questionOne(int question);  // 질문 상세보기
}
