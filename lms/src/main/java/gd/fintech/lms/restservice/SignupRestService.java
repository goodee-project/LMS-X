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
	
	//주소 검색
	public List<Address> getAddress(Address address){
		
		return signupRestMapper.selectAddress(address);
	}
}
