package gd.fintech.lms.teacher.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Syllabus;

@Mapper
public interface TeacherSyllabusMapper {
	// 파일 추가
	// Syllabus 객체에 데이터 저장
	int insertTeacherSyllabus(Syllabus syllabus);
	
	// 파일 삭제
	// Syllabus 객체에 데이터 삭제 강좌 번호(lectureNo) 사용
	int delteTeacherSyllabus(int lectureNo);
	
	// 강의 계획서 출력
	// 강좌 번호(lectureNo) 사용
	Syllabus selectTeacherSyllabusOne(int lectureNo);
	
	// 다운로드 횟수 증가
	// 강좌 번호(lectureNo) 사용
	int updateTeacherSyllabusCountUp(int lectureNo);
}
