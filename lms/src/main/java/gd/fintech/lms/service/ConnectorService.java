package gd.fintech.lms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.mapper.ConnectorMapper;
import gd.fintech.lms.vo.Account;

@Service
public class ConnectorService {
	@Autowired ConnectorMapper connectorMapper;
	
	// 계정 id로 사진과 이름 가져오기
	public Account selectAccountNameAndImage(String accountId){
		return connectorMapper.selectAccountNameAndImage(accountId);
	}
}
