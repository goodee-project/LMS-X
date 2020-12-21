package gd.fintech.lms.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerTextbookMapper;
import gd.fintech.lms.vo.Textbook;

@Service
@Transactional
public class ManagerTextbookService {
	@Autowired ManagerTextbookMapper managerTextbookMapper;
	
	public List<Textbook> getTextbookListByPage(Map<String, Object> map) {
		return managerTextbookMapper.selectTextbookListByPage(map);
	}
	
	public int getCountTextbook(int rowPerPage) {
		return managerTextbookMapper.selectTextbookCount();
	}
	
	public int insertTextbook(Textbook textbook) {
		return managerTextbookMapper.insertTextbook(textbook);
	}
	
	public int deleteTextbook(String textbookIsbn) {
		return managerTextbookMapper.deleteTextbook(textbookIsbn);
	}
	
	public int updateTextbook(Textbook textbook) {
		return managerTextbookMapper.updateTextbook(textbook);
	}
	
	public Textbook getTextbookOne(String textbookIsbn) {
		return managerTextbookMapper.selectTextbookOne(textbookIsbn);
	}
}
