package gd.fintech.lms.manager.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerMypageMapper;
import gd.fintech.lms.vo.Manager;

@Service
@Transactional
public class ManagerMypageService {
	@Autowired private ManagerMypageMapper managerMyPageMapper;
	
	private static final Logger log = LoggerFactory.getLogger(ManagerMypageService.class);

	// 운영자 마이페이지 정보
	public Manager selectManagerMypage(String accountId) {
		
		return managerMyPageMapper.selectManagerMypage(accountId);
	}
	
	// 운영자 마이페이지 정보 수정
	public int updateManagerMypage(Manager manager) {
		
		return managerMyPageMapper.updateManagerMypage(manager);
	}
	
}
