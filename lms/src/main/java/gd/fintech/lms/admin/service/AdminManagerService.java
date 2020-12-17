package gd.fintech.lms.admin.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.admin.mapper.AdminManagerMapper;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.ManagerQueue;

@Service
@Transactional
public class AdminManagerService {
	@Autowired private AdminManagerMapper adminManagerMapper;
	
	private static final Logger log = LoggerFactory.getLogger(AdminManagerService.class);

	// 운영자 승인 대기 목록
	public List<ManagerQueue> getManagerQueueList(){
		return adminManagerMapper.selectManagerQueueList();
	}
	
	// 운영자 승인 거절
	public void negativeManager(String accountId) {
		// 운영자 승인대기테이블 삭제
		adminManagerMapper.deleteManagerQueue(accountId);
		// 계정 테이블 삭제
		adminManagerMapper.deleteAccount(accountId);
	}
	
	// 운영자 승인
	public void accessManager(String accountId) {
		
		Account account = new Account();
		account.setAccountId(accountId);
		account.setAccountState("활성화");
		
		log.debug(account.toString());
		// 계정 정보 찾기
		Manager manager = adminManagerMapper.selectManagerQueueOne(accountId);
		manager.setManagerPosition("사원");
		manager.setManagerImage("default.jpg");
		// 계정 상태 업데이트
		adminManagerMapper.updateAccountState(account);
		// 운영자 테이블 추가
		adminManagerMapper.insertManager(manager);
		// 운영자 승인대기테이블 삭제
		adminManagerMapper.deleteManagerQueue(accountId);
	}
}
