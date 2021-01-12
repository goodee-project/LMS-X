package gd.fintech.lms.manager.restservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.restmapper.ManagerTextbookRestMapper;

@Service
@Transactional
public class ManagerTextbookRestService {
	@Autowired private ManagerTextbookRestMapper managerTextbookRestMapper;
	
	// 중복 교재 ISBN 체크
	public String selectManagerTextbookCheck(String textbookIsbn) {
		
		String textbookIsbnCheck = managerTextbookRestMapper.selectTextbookOne(textbookIsbn);
			if (textbookIsbnCheck != null) {
				textbookIsbnCheck = "false";
			} 
			
		return textbookIsbnCheck;
	}
}
