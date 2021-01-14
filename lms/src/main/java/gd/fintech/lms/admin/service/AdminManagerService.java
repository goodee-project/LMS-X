package gd.fintech.lms.admin.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.admin.mapper.AdminManagerMapper;
import gd.fintech.lms.common.PathUtil;
import gd.fintech.lms.vo.Account;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.ManagerQueue;
import gd.fintech.lms.vo.MypageImage;

@Service
@Transactional
public class AdminManagerService {
	@Autowired private AdminManagerMapper adminManagerMapper;
	@Autowired private PathUtil pathUtil;
	
	private static final Logger log = LoggerFactory.getLogger(AdminManagerService.class);

	// 운영자 승인 대기 목록
	public List<ManagerQueue> getManagerQueueList(int beginRow, int rowPerPage){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		return adminManagerMapper.selectManagerQueueList(map);
	}
	
	// 운영자 승인 대기 총 인원
	public int getManagerQueueCount() {
		
		return adminManagerMapper.selectManagerQueueCount();
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
		// 계정 상태 업데이트
		adminManagerMapper.updateAccountState(account);
		// 운영자 테이블 추가
		adminManagerMapper.insertManager(manager);
		// 운영자 승인대기테이블 삭제
		adminManagerMapper.deleteManagerQueue(accountId);
	}
	
	// 운영자 상세보기
	public Manager getManagerOne(String managerId) {
		return adminManagerMapper.selectManagerOne(managerId);
	}
	// 운영자 이미지 조회
	public MypageImage getManagerImage(String managerId) {
		return adminManagerMapper.selectManagerImage(managerId);
	}
	
	// 운영자 직급수정
	public int updateManagerPosition(Manager manager) {
		
		return adminManagerMapper.updateManagerOnePosition(manager);
	}
	
	// 계정 탈퇴
	public void deleteManagerAll(String managerId, HttpServletRequest request) {
			
		Account account = new Account();
		account.setAccountId(managerId);
		account.setAccountState("탈퇴");
		
		// 이미지 파일 조회
		MypageImage mi = adminManagerMapper.selectManagerImage(managerId);
		
		// 데이터베이스에 기존에 있던 이미지가 있으면 파일삭제
		if(mi != null) {
			// 이미지 경로 + 이미지 이름
			File file = new File(pathUtil.PATH("mypageImage", request) + mi.getMypageImageUuid());
			
			// 이미지가 존재하는 경우
			if (file.exists()) {
				// 이미지 삭제
				file.delete();
			}
			
			// 데이터베이스의 이미지 파일 삭제
			adminManagerMapper.selectManagerImage(managerId);
		}
		// 운영자 계정(탈퇴) 업데이트
		adminManagerMapper.updateManagerAccount(account);
		// 운영자 정보 삭제
		adminManagerMapper.deleteManagerOne(managerId);
		// 운영자 경력 삭제
		adminManagerMapper.deleteManagerCareer(managerId);
		// 운영자 자격증 삭제
		adminManagerMapper.deleteManagerLicense(managerId);
		
	}
}
