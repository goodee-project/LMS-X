package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Subject;

@Mapper
public interface ManagerSubjectMapper {
	public List<Subject> selectSubjectList();  // 과목 리스트
	public List<Subject> selectSubjectListByPage(Map<String, Object> map);  // 과목 리스트(페이징)
	int selectSubjectCount();					// 과목 페이징 카운트
	int insertSubject(Subject subject); 		// 과목 생성
	int deleteSubject(int subjectNo);			// 과목 삭제
	int updateSubject(Subject subject);			// 과목 수정
	Subject selectSubjectOne(int subjectNo);	// 과목 정보
}
