package gd.fintech.lms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import gd.fintech.lms.service.LoginService;

@Component
public class UserIntercepter extends HandlerInterceptorAdapter {
	@Autowired LoginService loginService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return true;
	}

	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		// 해당 계정의 안읽은 수신 쪽지 개수
		HttpSession session = request.getSession();
		String accountId = (String) session.getAttribute("loginId");		
		int noteNotReadReceiveCount = loginService.selectNoteReceiveCount(accountId);
		session.setAttribute("noteNotReadReceiveCount", noteNotReadReceiveCount);
	}

}
