package gd.fintech.lms.controller;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gd.fintech.lms.common.MailAuth;
import gd.fintech.lms.service.ForgotService;
import gd.fintech.lms.vo.Manager;
import gd.fintech.lms.vo.Student;
import gd.fintech.lms.vo.Teacher;

@Controller
public class ForgotController {
	@Autowired private ForgotService forgotService;
	private static final Logger log = LoggerFactory.getLogger(ForgotController.class);
	
	// 학생 아이디 및 비밀번호 찾기
	@GetMapping("/student/forgotIdAndPassword")
	public String studentAccountMailSend(HttpSession session) {
		// 로그인일 때  접속 차단
		if ( session.getAttribute("loginId") != null ) {
			// session에 들어 있는 loginLevel에 따라 index페이지 이동
			if ( session.getAttribute("loginLevel").equals(1) ) {
				return "redirect:/auth/student/index/1";
			}
			if ( session.getAttribute("loginLevel").equals(2) ) {
				return "redirect:/auth/teacher/index/1";
			}
			if ( session.getAttribute("loginLevel").equals(3) ) {
				return "redirect:/auth/manager/index";
			}
			if ( session.getAttribute("loginLevel").equals(4) ) {
				return "redirect:/auth/admin/index";
			}
		}
		return "studentForgotIdAndPassword";
	}
	// 강사 아이디 및 비밀번호 찾기
	@GetMapping("/teacher/forgotIdAndPassword")
	public String teacherAccountMailSend(HttpSession session) {
		// 로그인일 때  접속 차단
		if ( session.getAttribute("loginId") != null ) {
			// session에 들어 있는 loginLevel에 따라 index페이지 이동
			if ( session.getAttribute("loginLevel").equals(1) ) {
				return "redirect:/auth/student/index/1";
			}
			if ( session.getAttribute("loginLevel").equals(2) ) {
				return "redirect:/auth/teacher/index/1";
			}
			if ( session.getAttribute("loginLevel").equals(3) ) {
				return "redirect:/auth/manager/index";
			}
			if ( session.getAttribute("loginLevel").equals(4) ) {
				return "redirect:/auth/admin/index";
			}
		}
		return "teacherForgotIdAndPassword";
	}
	// 운영자 아이디 및 비밀번호 찾기
	@GetMapping("/manager/forgotIdAndPassword")
	public String managerAccountMailSend(HttpSession session) {
		// 로그인일 때  접속 차단
		if ( session.getAttribute("loginId") != null ) {
			// session에 들어 있는 loginLevel에 따라 index페이지 이동
			if ( session.getAttribute("loginLevel").equals(1) ) {
				return "redirect:/auth/student/index/1";
			}
			if ( session.getAttribute("loginLevel").equals(2) ) {
				return "redirect:/auth/teacher/index/1";
			}
			if ( session.getAttribute("loginLevel").equals(3) ) {
				return "redirect:/auth/manager/index";
			}
			if ( session.getAttribute("loginLevel").equals(4) ) {
				return "redirect:/auth/admin/index";
			}
		}
		return "managerForgotIdAndPassword";
	}
	
	@RequestMapping("/forgotIdAndPassword")
	public String accountMailSend(@RequestParam(name="name") String name,
								  @RequestParam(name="email") String email,
								  @RequestParam(name="phone") String phone,
								  @RequestParam(name="level") int level) {
		
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");
		
		Authenticator auth = new MailAuth();
		
		Session session = Session.getInstance(prop, auth);
		String accountId = null;
		String accountName = null;
		MimeMessage msg = new MimeMessage(session);
		
		// 비밀번호 랜덤 생성
		Random rnd =new Random();
		StringBuffer password =new StringBuffer();
		for(int i=0;i<6;i++){
		    // rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. true일 시 랜덤 한 소문자를, false 일 시 랜덤 한 숫자를 StringBuffer 에 append 한다.
		    if(rnd.nextBoolean()){
		    	password.append((char)((int)(rnd.nextInt(26))+97));
		    }else{
		    	password.append((rnd.nextInt(10)));
		    }
		}
		
		// 이메일과 아이디 찾기
		if(level == 1 ) {
			Student student = forgotService.GetStudent(email, name, phone);
			email = student.getStudentEmail();
			accountId = student.getStudentId();
			accountName = student.getStudentName();
		}
		if(level == 2 ) {
			Teacher teacher = forgotService.GetTeacher(email, name, phone);
			email = teacher.getTeacherEmail();
			accountId = teacher.getTeacherId();
			accountName = teacher.getTeacherName();
		}
		if(level == 3 ) {
			Manager manager = forgotService.GetManager(email, name, phone);
			email = manager.getManagerEmail();
			accountId = manager.getManagerId();
			accountName = manager.getManagerName();
		}
		// 비밀번호 변경
		String pw = password.toString();
		forgotService.updateAccountPassword(accountId, pw);
		
		// 아이디 뒤에 4자리 *로 변경
		accountId = accountId.substring(0,accountId.length()-4)+"****";
		
		try {
		    msg.setSentDate(new Date());
		    
		    msg.setFrom(new InternetAddress("lmsxgood@gmail.com", "LMSX관리자"));
			InternetAddress to = new InternetAddress(email);   
			msg.setRecipient(Message.RecipientType.TO, to);            
			msg.setSubject("안녕하세요!"+accountName+"님 LMSX 입니다.", "UTF-8");            
			msg.setText("안녕하세요."+accountName+"님 비밀번호가 변경되었습니다."+"\n 아이디 : "+accountId+ "\n 비밀번호 : "+ pw, "UTF-8");            
			          
		    Transport.send(msg);
		    
		} catch (AddressException ae) {            
			log.debug("AddressException : " + ae.getMessage());           
		} catch (MessagingException me) {            
			log.debug("MessagingException : " + me.getMessage());
		} catch (UnsupportedEncodingException e) {
			log.debug("UnsupportedEncodingException : " + e.getMessage());			
		}
		
		return "redirect:/";
	}
}


