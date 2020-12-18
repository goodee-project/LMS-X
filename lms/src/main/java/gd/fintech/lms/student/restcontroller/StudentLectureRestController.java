package gd.fintech.lms.student.restcontroller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import gd.fintech.lms.student.restservice.StudentLectureRestService;
import gd.fintech.lms.vo.ClassRegistration;

@RestController
public class StudentLectureRestController {
	@Autowired StudentLectureRestService studentLectureRestService;
	
	// 해당 강좌가 이미 수강신청이 되어있는지 체크
	@PostMapping("auth/student/lecture/checkClassRegistration")
	public boolean checkClassRegistration(ClassRegistration classRegistration, ServletRequest request) {
		// 세션에서 로그인 아이디 가져옴
		HttpSession session = ((HttpServletRequest)request).getSession();
		String studentId = (String)session.getAttribute("loginId");
		
		// classRegistration에 데이터 추가
		classRegistration.setAccountId(studentId);

		return studentLectureRestService.selectCheckClassRegistration(classRegistration);
	}
	
}
