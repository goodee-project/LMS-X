package gd.fintech.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.mapper.ManagerFaqMapper;
import gd.fintech.lms.vo.Faq;

@Service
@Transactional
public class ManagerFaqService {
	@Autowired ManagerFaqMapper managerFaqMapper;
	
	public List<Faq> getFaqList(){
		return managerFaqMapper.selectFaqList();
	}
}
