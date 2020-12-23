package gd.fintech.lms.teacher.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Answersheet;
import gd.fintech.lms.vo.Test;

@Mapper
public interface TeacherTestMapper {
	// 시험 정보 조회
	// 강좌 고유 번호(lectureNo)
	Test selectTestOne(int lectureNo);
	
	// 시험 정보 입력
	// 시험(Test) Vo 객체
	int insertTest(Test test);
	
	// 시험 정보 수정
	// 시험(Test) Vo 객체
	int updateTest(Test test);
	
	// 평가 답안지 학생 목록
	// 강좌 고유 번호(lectureNo)
	List<Answersheet> selectAnswersheetList(int lectureNo);
}
