package gd.fintech.lms.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerLoginLogMapper;
import gd.fintech.lms.vo.LoginLog;

@Service
@Transactional
public class ManagerLoginLogService {
	@Autowired private ManagerLoginLogMapper managerLoginLogMapper;
	
	// 로그인 로그 목록 출력
	public List<LoginLog> getLoginLogList(int beginRow, int rowPerPage) {
	
	Map<String,Object> map = new HashMap<String, Object>();
	map.put("beginRow", beginRow);
	map.put("rowPerPage", rowPerPage);
	
	return managerLoginLogMapper.selectLoginLogList(map);
	}
	
	//  로그인 로그 목록 페이징 카운트
	public int getLoginLogCount() {
		return managerLoginLogMapper.selectLoginLogCount();
	}
}
