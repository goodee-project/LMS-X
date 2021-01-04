package gd.fintech.lms.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerLoginLogMapper;
import gd.fintech.lms.vo.LoginLog;

@Service
@Transactional
public class ManagerLoginLogService {
	@Autowired private ManagerLoginLogMapper managerLoginLogMapper;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	// 로그인 로그 목록 출력
	public List<LoginLog> getLoginLogList(int beginRow, int rowPerPage, String searchText, String searchDate) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);			// 시작 데이터
		map.put("rowPerPage", rowPerPage);		// 한 페이지당 표시할 데이터 수
		map.put("searchText", searchText);		// 문자열 검색
		map.put("searchDate", searchDate);		// 날짜 검색
		return managerLoginLogMapper.selectLoginLogList(map);
	}
	
	//  로그인 로그 목록 페이징 카운트
	public int getLoginLogCount(String searchText, String searchDate) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("searchText", searchText);	// 문자열 검색
		map.put("searchDate", searchDate);	// 날짜 검색
		
		return managerLoginLogMapper.selectLoginLogCount(map);
	}
}