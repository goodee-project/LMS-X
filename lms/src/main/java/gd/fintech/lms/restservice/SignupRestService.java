package gd.fintech.lms.restservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.restmapper.SignupRestMapper;
import gd.fintech.lms.vo.Address;

@Service
@Transactional
public class SignupRestService {
	@Autowired private SignupRestMapper signupRestMapper;
	
	//아이디 중복검사
	public String checkAccountId(String accountId) {
		String accountIdCheck = signupRestMapper.selectAccountId(accountId);
			
		//만약 아이디가 없으면 true
		if(accountIdCheck==null) {
			accountIdCheck = "true";
			return accountIdCheck;
		}
		//아이디가 있으면 false
		accountIdCheck = "false";
		return accountIdCheck;
	}
	
	//이메일 중복검사
	public String checkEmail(String email) {
		String emailCheck ;
		
		if(signupRestMapper.selectStudentEmail(email)==null&&signupRestMapper.selectStudentQueueEmail(email)==null
			&&signupRestMapper.selectTeacherEmail(email)==null&&signupRestMapper.selectTeacherQueueEmail(email)==null
			&&signupRestMapper.selectManagerEmail(email)==null&&signupRestMapper.selectManagerQueueEmail(email)==null
			&&signupRestMapper.selectAdminEmail(email)==null) {
			
			emailCheck = "true";
			return emailCheck;
		}
		
		emailCheck = "false";
		return emailCheck;
	}
	
	//주소 검색
	public List<Address> getAddress(Address address){
		
		return signupRestMapper.selectAddress(address);
	}
}
