package gd.fintech.lms.student.restmapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentQnaRestMapper {
	
	// 질문 게시판 첨부파일 다운로드 횟수 증가
	int updateQnaFileCount(String questionFileUuid);
	
	// 질문 게시판 첨부파일 다운로드 횟수 가져오기
	int selectQnaFileCount(String questionFileUuid);
	
	// 질문 게시판 첨부파일 한개 삭제
	int deleteQnaFileOne(String questionFileUuid);
	
}
