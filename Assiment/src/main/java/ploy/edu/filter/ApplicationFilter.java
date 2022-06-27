package ploy.edu.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ploy.edu.entities.User;
import ploy.edu.utils.SessionUtils;


@WebFilter(urlPatterns = {
		"/Admin/*"
})
public class ApplicationFilter implements Filter {

    public ApplicationFilter() {
        // TODO Auto-generated constructor stub
    }
	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {	
		HttpServletRequest hRequest = (HttpServletRequest) request;
		HttpServletResponse hResponse = (HttpServletResponse) response;
//		HttpSession session = hRequest.getSession();
//		String uri = hRequest.getRequestURI();
		
		
		User user = (User) SessionUtils.get(hRequest, "user");
		
		if(user == null) {
			hResponse.sendRedirect("/Assiment/Login");
			return;
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
