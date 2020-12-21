package gd.fintech.lms.teacher.mapper;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Syllabus;

@Mapper
public interface SyllabusMapper {
	// 파일 추가
	// Syllabus 객체에 데이터 저장
	int insertSyllabus(Syllabus Syllabus);
	
	// 파일 삭제
	// Syllabus 객체에 데이터 삭제 강좌 번호(lectureNo) 사용
	int delteSyllabus(int lectureNo);
	
	// 강의 계획서 
	// 출력 강좌 번호(lectureNo) 사용
	Syllabus syllabusOne(int lectureNo);
}
