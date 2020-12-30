package gd.fintech.lms;

import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import gd.fintech.lms.service.ConnectorService;
import gd.fintech.lms.vo.Account;


@WebListener
public class UserListener implements HttpSessionAttributeListener {
	@Autowired ConnectorService connectorService;
	public ServletContext context;
	HashMap<String, Account> map = new HashMap<>();
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 세션에 값이 추가될때
    public void attributeAdded(HttpSessionBindingEvent se)  { 
         context = se.getSession().getServletContext(); // 톰캣 전역 변수

         if(se.getName() == "loginId") {
	         String sessionName = (String)se.getName();		// 추가된 세션의 이름
	         String sessionValue = (String)se.getValue();	// 추가된 세션의 값
	         // map = (HashMap<String, Account>)context.getAttribute("connector");
	         // 세션에서 가져온 loginId 값으로 해당 계정의 이름과 이미지 uuid를 가져옴
	         Account a = connectorService.selectAccountNameAndImage(sessionValue);	
	         
	         // 사용자의 정보를 map에 추가
	         map.put(sessionValue, a);
	
	    	 logger.trace("Session Added : " + sessionName + " : " + sessionValue);
	         
	    	 // 전역 변수에 map을 넣어줌
	         context.setAttribute("connector", map);
         }
         
    }

    public void attributeRemoved(HttpSessionBindingEvent se)  { 
        if(se.getName() == "loginId") {   	        	
	         String sessionValue = (String)se.getValue();	// 추가된 세션의 값
	         
	         logger.trace("Session Removed : " + sessionValue + " 로그아웃");
	         
	         map.remove(sessionValue);		// 맵에서 해당 사용자를 삭제함
        }
    }

    public void attributeReplaced(HttpSessionBindingEvent se)  { 
         // TODO Auto-generated method stub
    }
	
}
