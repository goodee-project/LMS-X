package gd.fintech.lms.student.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Answersheet;

@Mapper
public interface StudentTestRestMapper {
	// 해당 답안지가 이미 존재하는지
	public int selectCheckAnswersheet(Answersheet answersheet);
	// 해당 답안지를 제출
	public int insertAnswersheet(Answersheet answersheet);
	// 해당 답안지를 수정
	public int updateAnswersheet(Answersheet answersheet);

	// 문제를 다 풀었는지
	public int selectCheckTestFinish(Map<String, Object> map);
}
