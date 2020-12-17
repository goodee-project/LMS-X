package gd.fintech.lms.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerFaqMapper;
import gd.fintech.lms.vo.Faq;

@Service
@Transactional
public class ManagerFaqService {
	@Autowired ManagerFaqMapper managerFaqMapper;
	
	public List<Faq> getFaqList() {
		return managerFaqMapper.selectFaqList();
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
	
	public Faq faq(int faqNo) {
		return managerFaqMapper.faqOne(faqNo);
	}
}
