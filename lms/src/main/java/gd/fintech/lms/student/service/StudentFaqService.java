package gd.fintech.lms.student.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.student.mapper.StudentFaqMapper;
import gd.fintech.lms.vo.Faq;
import gd.fintech.lms.vo.FaqCategory;

@Service
@Transactional
public class StudentFaqService {
	@Autowired StudentFaqMapper studentFaqMapper;
	
	// FAQ 카테고리 목록 가져오기
	public List<FaqCategory> selectFaqCategoryList(){
		return studentFaqMapper.selectFaqCategoryList();
	}
	
	// FAQ 목록 가져오기
	public List<Faq> selectFaqListByPage(Map<String, Object> map){
		return studentFaqMapper.selectFaqListByPage(map);
	}
	
	// FAQ 게시글 전체 개수 가져오기
	public int selectFaqListCount(Map<String, Object> map) {
		return studentFaqMapper.selectFaqListCount(map);
	}
	
	// FAQ 상세보기
	public Faq selectFaqOne(int faqNo) {
		// 조회수 증가
		studentFaqMapper.updateFaqCount(faqNo);
		
		return studentFaqMapper.selectFaqOne(faqNo);
	}
	
}
