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
	
	// 운영자 목록 출력
	public List<Manager> getManagerList(int beginRow, int rowPerPage){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		return adminIndexMapper.selectManagerList(map);
	}
	
	// 운영자 총 인원
	public int getManagerCount() {
		return adminIndexMapper.selectManagerCount();
	}

}
