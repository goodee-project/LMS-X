package gd.fintech.lms.restcontroller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.restservice.SignupRestService;
import gd.fintech.lms.vo.Address;

@RestController
public class SignupRestController {
	@Autowired SignupRestService signupRestService;
	 
	private static final Logger log = LoggerFactory.getLogger(SignupRestController.class);

	//주소찾기
	@GetMapping("/signup/address")
	public List<Address> selectAddress(Address address){
		log.debug("address 접속 성공");
		log.debug(address.toString());
		
			return signupRestService.getAddress(address);
		
	}
}
