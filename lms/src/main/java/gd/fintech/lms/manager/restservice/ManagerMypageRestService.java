package gd.fintech.lms.manager.restservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.manager.restmapper.ManagerMypageRestMapper;
import gd.fintech.lms.vo.Career;

@Service
@Transactional
public class ManagerMypageRestService {
	@Autowired private ManagerMypageRestMapper managerMypageRestMapper;
	
	// 운영자 마이페이지 정보 검색
	public List<Career> getManagerMypageCareer(String accountId){
		
		return managerMypageRestMapper.selectManagerMypageCareer(accountId);
	}
	
}
