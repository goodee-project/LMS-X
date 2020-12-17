package gd.fintech.lms.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.manager.mapper.ManagerFaqCategoryMapper;
import gd.fintech.lms.vo.FaqCategory;

@Service
public class ManagerFaqCategoryService {
	@Autowired ManagerFaqCategoryMapper managerFaqCategoryMapper;
	
	public List<FaqCategory> getFaqCategoryList() {
		return managerFaqCategoryMapper.selectFaqCategoryList();
	}
}
