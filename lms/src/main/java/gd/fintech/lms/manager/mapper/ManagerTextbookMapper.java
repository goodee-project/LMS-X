package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Textbook;

@Mapper
public interface ManagerTextbookMapper {
	public List<Textbook> selectTextbookListByPage(Map<String, Object> map); 	// 교재 리스트
	int selectTextbookCount();							// 교재 페이징 카운트
	int insertTextbook(Textbook textbook);  			// 교재 추가
	int deleteTextbook(String textbookIsbn);			// 교재 삭제
	int updateTextbook(Textbook textbook);				// 교재 수정
	Textbook selectTextbookOne(String textbookIsbn); 	// 교제 정보
}
