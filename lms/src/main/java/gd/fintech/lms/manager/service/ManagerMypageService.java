package gd.fintech.lms.manager.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerMypageMapper;
import gd.fintech.lms.vo.Career;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.ManagerForm;

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
	public void updateManagerMypage(ManagerForm managerForm) {
		Manager manager = new Manager();
		manager.setManagerId(managerForm.getManagerId());
		manager.setManagerName(managerForm.getManagerName());
		manager.setManagerEmail(managerForm.getManagerEmail());
		manager.setManagerBirth(managerForm.getManagerBirth());
		manager.setManagerAddressMain(managerForm.getManagerAddressMain());
		manager.setManagerAddressSub(managerForm.getManagerAddressSub());
		manager.setManagerGender(managerForm.getManagerGender());
		manager.setManagerPhone(managerForm.getManagerPhone());
		//managerMyPageMapper.updateManagerMypage(manager);
		log.debug(manager.toString());
		log.debug(managerForm.toString());
		//form 넘어 오는지 체크
		List<Career> careerList =null;
		if (managerForm.getCareerList() != null) {
			careerList = new ArrayList<Career>();
			//https://everyflower.tistory.com/173
			for (Career c : manager.getCareerList()) {
				Career career = new Career();
				
				career.setAccountId(c.getAccountId());
			}
		}
	}
	
}
