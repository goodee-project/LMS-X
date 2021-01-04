package gd.fintech.lms.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerFaqMapper;
import gd.fintech.lms.vo.Faq;
import gd.fintech.lms.vo.FaqCategory;

@Service
@Transactional
public class ManagerFaqService {
	@Autowired ManagerFaqMapper managerFaqMapper;
	
	public List<Faq> getFaqListByPage(Map<String, Object> map) {
		return managerFaqMapper.selectFaqListByPage(map);
	}
	
	public int getCountFaq(int rowPerPage) {
		return managerFaqMapper.selectFaqCount();
	}
	
	public int insertFaq(Faq faq) {
		return managerFaqMapper.insertFaq(faq);
	}
	
	public int deleteFaq(int faqNo) {
		return managerFaqMapper.deleteFaq(faqNo);
	}
	
	public int updateFaq(Faq faq) {
		return managerFaqMapper.updateFaq(faq);
	}
	
	public Faq getFaqOne(int faqNo) {
		return managerFaqMapper.selectFaqOne(faqNo);
	}
	
	// FAQ 게시판 상세보기 조회수 증가
	public int updateFaqCountUp(int faqNo) {
		return managerFaqMapper.updateFaqCount(faqNo);
	}
	
	// FAQ 카테고리 조회
	public List<FaqCategory> getFaqCategoryList() {
		return managerFaqMapper.selectFaqCategoryList();
	}
}
