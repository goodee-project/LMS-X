package gd.fintech.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.mapper.ManagerAccountMapper;
import gd.fintech.lms.vo.Account;

@Service
public class ManagerAccountService {
	@Autowired ManagerAccountMapper managerAccountMapper;
	
	public List<Account> getAccountList(){
		return managerAccountMapper.selectAccountList();
	}
}
