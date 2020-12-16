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

@WebFilter(urlPatterns = "/auth/teacher/*")
public class LoginTeacherFilter implements Filter {
	
	private static final Logger log = LoggerFactory.getLogger(LoginTeacherFilter.class);

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		//System.out.println("Debug: LoginTeacherFilter 실행");
		log.debug("LoginTeacherFilter 실행");
		HttpSession session = ((HttpServletRequest) request).getSession();

		//권한실패
		if (!session.getAttribute("loginLevel").equals(2)) {
			((HttpServletResponse) response).sendRedirect(((HttpServletRequest) request).getContextPath() + "/");

			return;
		}

		chain.doFilter(request, response);
	}
}
