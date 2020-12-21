package gd.fintech.lms.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.admin.mapper.AdminIndexMapper;
import gd.fintech.lms.vo.Manager;

@Service
@Transactional
public class AdminIndexService {
	@Autowired private AdminIndexMapper adminIndexMapper;
	
	// 운영자 목록 출력 및 검색
	public List<Manager> getManagerList(int beginRow, int rowPerPage, Manager manager){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		map.put("managerPosition", manager.getManagerPosition());
		map.put("managerName", manager.getManagerName());
		return adminIndexMapper.selectManagerList(map);
	}
	
	// 운영자 총 인원
	public int getManagerCount(Manager manager) {
		return adminIndexMapper.selectManagerCount(manager);
	}

}
