package gd.fintech.lms.restservice;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.restmapper.PwUpdateRestMapper;

@Service
@Transactional
public class PwUpdateRestService {
	@Autowired private PwUpdateRestMapper pwUpdateRestMapper;
	
	// 비밀번호로 아이디 찾기 있으면 true 없으면 false
	public String selectAccount(String accountId,String accountPw) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountId", accountId);
		map.put("accountPw", accountPw);
		String selectAccountId = pwUpdateRestMapper.selectAccount(map);
		String returnAccountCheck = "false";
		
		if (selectAccountId != null) {
			returnAccountCheck = "true";
		}
		
		return returnAccountCheck;
	}
	
	// 비밀번호 수정
	public int updateAccount(String accountId, String accountPw) { 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountId", accountId);
		map.put("accountPw", accountPw);
		
		return pwUpdateRestMapper.updateAccountPw(map);
	}
}
