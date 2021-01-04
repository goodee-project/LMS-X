package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ManagerQuestionFileMapper {
	
	// 질문 게시판 파일 이름 리스트
	List<String> selectManagerQuestionFileNameList(int questionNo);
	
	// 질문 게시판 파일 삭제
	int deleteManagerQuestionFile(int questionNo);
}
