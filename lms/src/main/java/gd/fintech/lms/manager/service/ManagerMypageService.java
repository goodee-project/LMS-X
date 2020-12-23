package gd.fintech.lms.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.mapper.ManagerMypageMapper;
import gd.fintech.lms.vo.Career;
import gd.fintech.lms.vo.License;
import gd.fintech.lms.vo.Manager;

@Service
@Transactional
public class ManagerMypageService {
	@Autowired private ManagerMypageMapper managerMypageMapper;
	
	// 운영자 마이페이지 정보
	public Manager selectManagerMypage(String accountId) {
		
		return managerMypageMapper.selectManagerMypage(accountId);
	}
	
	// 운영자 마이페이지 정보 수정
	public int updateManagerMypage(Manager manager) {
		
		return managerMypageMapper.updateManagerMypage(manager);
	}
	
	// 운영자 마이페이지 경력 추가
	public void insertManagerMypageCareer(Career career) {
		
		managerMypageMapper.insertManagerMypageCareer(career);
		managerMypageMapper.updateManagerUpdatedate(career.getAccountId());
	}
	
	// 운영자 마이페이지 경력 삭제
	public void deleteManagerMypageCareer(int careerNo, String accountId) {
		
		managerMypageMapper.deleteManagerMypageCareer(careerNo);
		managerMypageMapper.updateManagerUpdatedate(accountId);
	}
	
	// 운영자 마이페이지 자격증 추가
	public void insertManagerMypageLicense(License license) {
		managerMypageMapper.insertManagerMypageLicense(license);
		managerMypageMapper.updateManagerUpdatedate(license.getAccountId());
	}
	
	// 운영자 마이페이지 자격증 삭제
	public void deleteManagerMypageLicense(int licenseNo, String accountId) {
		managerMypageMapper.deleteManagerMypageLicense(licenseNo);
		managerMypageMapper.updateManagerUpdatedate(accountId);
	}
}
