package restful.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import restful.entity.MyUser;

/**
 * 过滤未登录时，直接通过url访问除login.jsp与register.jsp之外的界面
 *
 */
public class IsLoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("-------IsLoginFilterDestroyed--------");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		//向下转型为HttpServletRequest
		HttpServletRequest req = (HttpServletRequest) request;
		//获取请求的路径
		String requestURI = req.getRequestURI();
		//判断是否为login.jsp或register.jsp结尾
		if(requestURI.endsWith("login.jsp") || requestURI.endsWith("register.jsp") 
				|| requestURI.endsWith("cache") || requestURI.endsWith("login") || requestURI.endsWith("register") || requestURI.endsWith(".png") || requestURI.endsWith(".jpg") || requestURI.endsWith(".js") || requestURI.endsWith(".css") || req.getSession().getAttribute("curUser") != null) {
			chain.doFilter(request, response);
		} else {
			//若未登录，转至错误页面
				((HttpServletResponse) response).sendRedirect("/suit/jsp/login.jsp");
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("-------IsLoginFilterStarted--------");
	}

}
