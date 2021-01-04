package gd.fintech.lms;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import gd.fintech.lms.service.LoginService;

@WebFilter(urlPatterns = "/auth/*")
public class FirstLoginFilter implements Filter {
	@Autowired LoginService loginService;
	private static final Logger log = LoggerFactory.getLogger(FirstLoginFilter.class);

	public ServletContext context;	// 톰캣 전역변수
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		// System.out.println("Debug:FirstLoginFilter 실행");
		log.debug("FirstLoginFilter 실행");
		HttpSession session = ((HttpServletRequest) request).getSession();
		// 로그인 실패
		if (session.getAttribute("loginId") == null) {
			((HttpServletResponse) response).sendRedirect(((HttpServletRequest) request).getContextPath() + "/");

			return;
		}

		
		String accountId = (String) session.getAttribute("loginId");
		context = session.getServletContext();
		// 해당 계정의 안읽은 수신 쪽지 개수
		int noteNotReadReceiveCount = loginService.selectNoteReceiveCount(accountId);
		context.setAttribute("noteNotReadReceiveCount", noteNotReadReceiveCount);
		chain.doFilter(request, response);
	}
}
