package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Question;

@Mapper
public interface StudentQnaMapper {
	
	// 학생 : 강의별 질문 게시판 목록(페이징)
	List<Question> selectStudentQnaListByPage(Map<String, Object> map);
	
	// 학생 : 강의별 질문 게시판 상세보기
	Question selectStudentQnaOne(int questionNo);
	
	// 페이징을 위한 질문 게시글 수
	int selectQnaCount();
	
	// 학생 : 질문 게시판 게시글 작성
	int insertStudentQna(Question question);
	
	// 학생 : 질문 게시판 게시글 삭제
	int deleteStudentQna(int questionNo);
	
	// 학생 : 질문 게시판 게시글 수정
	int updateStudentQna(Question question);
}
