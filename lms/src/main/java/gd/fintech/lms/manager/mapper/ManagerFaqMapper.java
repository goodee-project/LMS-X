package gd.fintech.lms.manager.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Faq;
import gd.fintech.lms.vo.FaqCategory;

@Mapper
public interface ManagerFaqMapper {
	// FAQ 리스트
	public List<Faq> selectFaqListByPage(Map<String, Object> map); 
	
	// FAQ 페이징 카운트
	int selectFaqCount();	
	
	// FAQ 추가
	int insertFaq(Faq faq); 
	
	// FAQ 삭제
	int deleteFaq(int faqNo); 	
	
	// FAQ 수정
	int updateFaq(Faq faq); 	
	
	// FAQ 상세보기
	Faq selectFaqOne(int faqNo); 	
	
	// FAQ 게시판 조회수 증가
	int updateFaqCount(int faqNo);
	
	// FAQ 카테고리
	public List<FaqCategory> selectFaqCategoryList();
}
