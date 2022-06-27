package ploy.edu.controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import ploy.edu.dao.UserDao;
import ploy.edu.entities.User;
import ploy.edu.utils.EncrytptUtils;

@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;

	public RegisterServlet() {
		super();
		this.userDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/users/sites/register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			
			String encrytp = EncrytptUtils.Encrypt(request.getParameter("password"));
			user.setPassword(encrytp);

			this.userDao.create(user);

			request.setAttribute("message", "Đăng Ký Thành Công");
			request.getRequestDispatcher("/views/users/sites/register.jsp").forward(request, response);

		} catch (Exception e) {
			request.setAttribute("error", "ERROR:" + e.getMessage());
			e.printStackTrace();
		}
	}

}
