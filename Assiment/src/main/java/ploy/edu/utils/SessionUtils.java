package ploy.edu.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUtils {
	
	public static void set(HttpServletRequest request, String name, Object value) {
		HttpSession session = request.getSession();
		session.setAttribute(name, value);
	}
	
	public static Object get(HttpServletRequest request, String name) {
		HttpSession session = request.getSession();
		return session.getAttribute(name);
	}
	
	public static void inVAlidate(HttpServletRequest request,String name) {
		HttpSession session = request.getSession();
		session.removeAttribute(name);
		session.invalidate();
	}
	
	public static boolean isLogin(HttpServletRequest request, String name) {
		return get(request, name) != null;
	}
}
