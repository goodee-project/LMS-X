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

import gd.fintech.lms.vo.Account;

@WebFilter(urlPatterns = "/auth/student/*")
public class StudentLoginFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		System.out.println("Debug: LoginStudentFilter 실행");

		HttpSession session = ((HttpServletRequest) request).getSession();

		//권한실패
		if (!session.getAttribute("loginLevel").equals("1")) {
			
			((HttpServletResponse) response).sendRedirect(((HttpServletRequest) request).getContextPath() + "/login");

			return;
		}

		chain.doFilter(request, response);
	}
}
