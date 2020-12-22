package gd.fintech.lms.teacher.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.teacher.mapper.TeacherQuestionMapper;
import gd.fintech.lms.vo.Question;

@Service
@Transactional
public class TeacherQuestionService {
	@Autowired private TeacherQuestionMapper teacherQuestionMapper;

	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 강좌 질문 게시판 목록 출력
	// 강좌 번호(lecureNo)
	public List<Question> getTeacherQuestionListByPage(int lectureNo, int beginRow, int rowPerPage){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("lectureNo", lectureNo);	//강의실 고유 번호
		map.put("beginRow", beginRow);		//시작 데이터
		map.put("rowPerPage", rowPerPage);	// 한 페이지 당 표시할 데이터 수
		
		List<Question> teacherQuestionList = teacherQuestionMapper.selectTeacherQuestionListByPage(map);
		
		// [Logger] 강좌 질문 목록(teacherQuestionList)
		logger.trace("teacherQuestionList [" + teacherQuestionList +"]");
		
		return teacherQuestionList;
	}
	
	// 질문 게시판에 있는 게시글 개수 계산
	// 강좌 번호(lectureNo) 사용
	public int getCountTeacherQuestion(int lectureNo) {
		return teacherQuestionMapper.selectTeacherQuestionListCount(lectureNo);
	}
	
	// 질문 게시판 상세보기
	// 질문 고유 번호(questionNo)
	public List<Question> selecteTeacherQuestionOne(int questionNo) {
		List<Question> questionOne = teacherQuestionMapper.selecteTeacherQuestionOne(questionNo);
		
		return questionOne;
	}
}
