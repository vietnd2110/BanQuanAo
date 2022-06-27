package ploy.edu.controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ploy.edu.dao.UserDao;
import ploy.edu.entities.User;
import ploy.edu.utils.EncrytptUtils;
import ploy.edu.utils.SessionUtils;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;

	public LoginServlet() {
		super();
		this.userDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/users/sites/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {

			User user = this.userDao.findByEmail(email);
			

			boolean check = EncrytptUtils.check(password, user.getPassword());

			if (check == true && user.getRole() == 1) {
				SessionUtils.set(request, "user", user);
				/* request.setAttribute("isLogin", true); */
				response.sendRedirect("/Assiment/Admin/UserManagement/index");
			} else if (check == true && user.getRole() == 0) {
				SessionUtils.set(request, "user", user);	
				response.sendRedirect("/Assiment/Home");
			} else {
				SessionUtils.set(request, "error", "Sai email hoặc password");
				response.sendRedirect("/Assiment/Login");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
