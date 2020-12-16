package gd.fintech.lms;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebFilter(urlPatterns = "/auth/*")
public class FirstLoginFilter implements Filter {
	
	private static final Logger log = LoggerFactory.getLogger(FirstLoginFilter.class);

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

	//	System.out.println("Debug:FirstLoginFilter 실행");
		log.debug("FirstLoginFilter 실행");
		HttpSession session = ((HttpServletRequest) request).getSession();

		// 로그인 실패
		if (session.getAttribute("loginId") == null) {
			((HttpServletResponse) response).sendRedirect(((HttpServletRequest) request).getContextPath() + "/");

			return;
		}

		chain.doFilter(request, response);
	}
}
