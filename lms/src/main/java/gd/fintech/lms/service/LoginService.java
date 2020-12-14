package gd.fintech.lms.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.mapper.LoginMapper;
import gd.fintech.lms.vo.Account;

@Service
@Transactional
public class LoginService {
	@Autowired private LoginMapper loginMapper;
	
	public Account loginCheck(Account account){
		Account loginCheck= loginMapper.loginCheck(account);
		
		//loginCheck가 null이 아니면 loginCheck값을 리턴 
		if(loginCheck!=null) {
			return loginCheck;
		}
		
		//null이면 null 리턴
		return null;
		
	}
}
