package gd.fintech.lms.manager.restservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.manager.restmapper.ManagerNoteRestMapper;

@Service
public class ManagerNoteRestService {
	@Autowired ManagerNoteRestMapper managerNoteRestMapper;
	
	// 검색으로 계정 목록 가져오기
	public List<Map<String, Object>> selectAccountList(String searchAccount) {
		return managerNoteRestMapper.selectAccountList(searchAccount);
	}
}
