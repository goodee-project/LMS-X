package gd.fintech.lms.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Faq;
import gd.fintech.lms.vo.FaqCategory;

@Mapper
public interface StudentFaqMapper {
	// FAQ 카테고리 목록 가져오기
	public List<FaqCategory> selectFaqCategoryList();
	
	// FAQ 목록 가져오기
	public List<Faq> selectFaqListByPage(Map<String, Object> map);
	
	// FAQ 게시글 전체 개수 가져오기
	public int selectFaqListCount();
	
	// FAQ 상세보기
	public Faq selectFaqOne(int faqNo);
	
	// FAQ 조회수 증가
	public int updateFaqCount(int faqNo);
}
