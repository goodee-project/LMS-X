package gd.fintech.lms.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.restservice.ForgotRestService;

@RestController
public class ForgotRestController {
	@Autowired private ForgotRestService forgotRestService;
	
	// 학생 정보 찾기
	@GetMapping("/student/forgotCheck/{email}/{name}/{phone}")
	public String selectStudent(@PathVariable(name="email") String email,
								@PathVariable(name="name") String name,
								@PathVariable(name="phone") String phone) {
		
		return forgotRestService.selectStudent(email, name, phone);
	}
	// 강사 정보 찾기
	@GetMapping("/teacher/forgotCheck/{email}/{name}/{phone}")
	public String selectTeacher(@PathVariable(name="email") String email,
								@PathVariable(name="name") String name,
								@PathVariable(name="phone") String phone) {
		
		return forgotRestService.selectTeacher(email, name, phone);
	}
	// 운영자 정보 찾기
	@GetMapping("/manager/forgotCheck/{email}/{name}/{phone}")
	public String selectManager(@PathVariable(name="email") String email,
								@PathVariable(name="name") String name,
								@PathVariable(name="phone") String phone) {
		
		return forgotRestService.selectManager(email, name, phone);
	}
}
