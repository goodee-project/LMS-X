package gd.fintech.lms.restcontroller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.restservice.SignupRestService;
import gd.fintech.lms.vo.Address;

@RestController
public class SignupRestController {
	@Autowired SignupRestService signupRestService;
	 
	private static final Logger log = LoggerFactory.getLogger(SignupRestController.class);

	//도로명으로 주소찾기
	@GetMapping("/signup/address/{street}/{building1}/{building2}")
	public List<Address> selectAddress(@PathVariable(name="street")String street,
									   @PathVariable(name="building1")String building1,
									   @PathVariable(name="building2")String building2){
		log.debug("address 도로명찾기 접속 성공");
		log.debug(street);
		log.debug(building1);
		log.debug(building2);
		
		Address address = new Address();
		address.setStreet(street);
		address.setBuilding1(building1);
		address.setBuilding2(building2);
		
		log.debug(address.toString());
		
		return signupRestService.getAddress(address);
		
	}
	//아이디 중복 체크
	@GetMapping("/signup/accountIdCheck/{accountId}")
	public String selectAccountId(@PathVariable(name="accountId")String accountId) {
		
		return signupRestService.checkAccountId(accountId);
	}
	//이메일 중복 체크
	@GetMapping("/signup/emailCheck/{email}")
	public String selectEmail(@PathVariable(name="email")String email) {
		return signupRestService.checkEmail(email);
	}
}
