package gd.fintech.lms.restservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.restmapper.LoginRestMapper;
import gd.fintech.lms.vo.Account;

@Service
@Transactional
public class LoginRestService {
	@Autowired private LoginRestMapper loginRestMapper;
	
	public String CheckAccountState(String accountId ,String accountPw, int accountLevel) {
		Account account = new Account();
		account.setAccountId(accountId);
		account.setAccountPw(accountPw);
		account.setAccountLevel(accountLevel);
		
		String accountStateCheck = "none"; 
		// 로그인 정보가 있으면 값 넣어주기  없으면 null
		if ( loginRestMapper.selectAccountState(account) != null ) {
			accountStateCheck = loginRestMapper.selectAccountState(account);
		}
		
		// 상태가 대기인 경우
		if ( accountStateCheck.equals("대기") ) {
			accountStateCheck = "wait";
			 
		}
		// 상태가 탈퇴인 경우
		if ( accountStateCheck.equals("탈퇴") ) {
			accountStateCheck = "secession";
			
		}
		// 상태가 활성화인 경우
		if ( accountStateCheck.equals("활성화") ) { 
			accountStateCheck = "active";
		}
		
		return accountStateCheck;
	}
}
