package gd.fintech.lms.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.manager.mapper.ManagerAccountMapper;
import gd.fintech.lms.vo.Account;

@Service
public class ManagerAccountService {
	@Autowired ManagerAccountMapper managerAccountMapper;
	
	public List<Account> getAccountList() {
		return managerAccountMapper.selectAccountList();
	}
	
	public List<Account> getFaqAccountList() {
		return managerAccountMapper.selectFaqAccountList();
	}
	
	public List<Account> getManagerAccountList() {
		return managerAccountMapper.selectManagerAccountList();
	}
	
	public int updateAccount(Account account) {
		return managerAccountMapper.updateAccount(account);
	}
	
	public Account getAccountOne(String accountId) {
		return managerAccountMapper.selectAccountOne(accountId);
	}
}
