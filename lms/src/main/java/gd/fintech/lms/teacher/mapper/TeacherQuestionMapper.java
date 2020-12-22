package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Question;

@Mapper
public interface TeacherQuestionMapper {
	// 질문 목록 리스트
	// 강좌 고유 번호(lectureNo), 시작 데이터 번호(beginRow), 페이지 당 표시 데이터 수 (rowPerPage)를 사용
	List<Question> selectTeacherQuestionListByPage(Map<String, Integer> map);
	
	// 질문 목록 페이지 카운트
	// 강좌 고유 번호(lectureNo) 사용
	int selectTeacherQuestionListCount(int lectureNo);
	
	// 질문 상세보기
	// 강좌 질문 번호 사용
	List<Question> selecteTeacherQuestionOne(int questionNo);
	
	// 질문 게시판 조회수 증가
	// 강좌 질문 번호(questionNo) 사용
	int updateTeacherQuestionCountUp(int questionNo);
}
