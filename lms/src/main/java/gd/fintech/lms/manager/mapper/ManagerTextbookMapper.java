package gd.fintech.lms.manager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Textbook;

@Mapper
public interface ManagerTextbookMapper {
	List<Textbook> selectTextbookList(); 	// 교재 리스트
	int insertTextbook(Textbook textbook);  // 교재 추가
	int deleteTextbook(String textbookIsbn);	// 교재 삭제
	int updateTextbook(Textbook textbook);	// 교재 수정
	Textbook textbookOne(String textbookIsbn); // 교제 정보
}
