package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Subject;

@Mapper
public interface ManagerSubjectMapper {
	List<Subject> selectSubjectList();  // 과목 리스트
	int insertSubject(Subject subject); // 과목 생성
	int deleteSubject(int subjectNo);	// 과목 삭제
	int updateSubject(Subject subject);	// 과목 수정
	Subject selectSubjectOne(int subjectNo);  // 과목 정보
}
