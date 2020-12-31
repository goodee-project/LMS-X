package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Question;

@Mapper
public interface ManagerQuestionMapper {
	// 질문 리스트
	public List<Question> selectManagerQuestionListByPage(Map<String, Integer> map);
	
	// 질문 페이징 카운트
	int selectManagerQuestionCount(int lectureNo);					
	
	// 질문 삭제
	int deleteManagerQuestion(int questionNo);			
	
	// 질문 상세보기
	Question selectManagerQuestionOne(int questionNo);   
	
	// 질문 게시판 조회수 증가
	int updateManagerQuestionCount(int questionNo);
}
