package gd.fintech.lms.teacher.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Answersheet;
import gd.fintech.lms.vo.Multiplechoice;
import gd.fintech.lms.vo.MultiplechoiceExample;
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
	
	// 객관식 문제 목록
	// 강좌 고유 번호(lectureNo), 시작 데이터 번호(beginRow), 페이지당 표시 데이터 수(rowPerPage)
	List<Multiplechoice> selectMultiplechoiceList(Map<String, Integer> map);
	
	// 객관식 문제 목록 카운트
	// 강좌 고유번호(lectureNo)
	int selectMultiplechoiceListCount(int lectureNo);
	
	// 평가 학생 답안지 조회
	// 강좌 고유번호(lectureNo)
	List<Multiplechoice> selectMultiplechoiceOne(int lectureNo);
	
	// 객관식 문제 보기
	Multiplechoice selectMultiplechoiceExampleList(int multiplechoiceNo);
	
	// 객관식 문제 보기 수정
	int updateMultiplechoiceExample(MultiplechoiceExample multiplechoiceExample);
	
	// 객관식 문제 수정
	int updateMultiplechoice(Multiplechoice multiplechoice);
	
	// 객관식 문제 추가
	int insertMultiplechoice(Multiplechoice multiplechoice);
	
	// 객관식 문제 보기 추가
	int insertMultiplechoiceExample(MultiplechoiceExample multiplechoiceExample);
	
	// 객관식 문제 보기 삭제
	int deleteMultiplechoiceExample(int multiplechoiceNo);
	
	// 객관식 문제 삭제
	int deleteMultiplechoice(int multiplechoiceNo);
	
	// 객관식 문제들의 번호 가져오기
	List<Integer> selectMultiplechoiceIdList(int lectureNo);
	
	// 객관식 문제 번호 변경
	int updateMultiplechoiceId(Map<String, Object> map);
}
