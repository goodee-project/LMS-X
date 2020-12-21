package gd.fintech.lms.student.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.QuestionFile;

@Mapper
public interface StudentQnaFileMapper {

	// 학생 : 질문 게시판 파일 이름 리스트
	List<String> selectStudentQnaFileNameList(int questionNo);
	
	// 학생: 질문 게시판 파일 추가
	int insertStudentQnaFile(QuestionFile questionFile);
	
	// 학생 : 질문 게시판 파일 삭제
	int deleteStudentQnaFile(int questionNo);
	
	// 학생 : 질문 게시판 수정시 파일 한개만 삭제 하는 기능
	int deleteStudentQnaFileOne(String questionFileUuid);
	

}
