package gd.fintech.lms.student.restservice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.student.restmapper.StudentTestRestMapper;
import gd.fintech.lms.vo.Answersheet;

@Service

public class StudentTestRestService {
	@Autowired StudentTestRestMapper studentTestRestMapper;
	
	// 해당 문제의 답안을 이미 제출 했는지
	public int selectCheckAnswersheet(Answersheet answersheet) {
		return studentTestRestMapper.selectCheckAnswersheet(answersheet);
	}
	// 해당 답안지를 제출
	public int insertAnswersheet(Answersheet answersheet) {
		return studentTestRestMapper.insertAnswersheet(answersheet);
	}
	
	// 해당 답안지를 수정
	public int updateAnswersheet(Answersheet answersheet) {
		return studentTestRestMapper.updateAnswersheet(answersheet);
	}
	
	// 문제를 다 풀었는지
	public int selectCheckTestFinish(Map<String, Object> map) {
		return studentTestRestMapper.selectCheckTestFinish(map);
	}
}
