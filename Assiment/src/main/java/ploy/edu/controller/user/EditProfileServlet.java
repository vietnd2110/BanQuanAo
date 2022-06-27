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
import ploy.edu.utils.SessionUtils;
import ploy.edu.utils.UploadFileUtils;

@WebServlet("/EditProfile")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;

	public EditProfileServlet() {
		super();
		this.userDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user1 = (User) SessionUtils.get(request, "user");

		if (user1 == null) {
			response.sendRedirect("/Assiment/Login");
			return;
		}

		User user = this.userDao.findByEmail(user1.getEmail());

		request.setAttribute("user", user);
		request.getRequestDispatcher("/views/users/sites/edit-profile.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		try {
			
			BeanUtils.populate(user, request.getParameterMap());
			
			User user1 = (User) SessionUtils.get(request, "user");
			User user2 = this.userDao.findByEmail(user1.getEmail());
			
			if(request.getPart("avatar").getSize() == 0) {
				user.setAvatar(user2.getAvatar());
			}else {
				user.setAvatar(UploadFileUtils.UploadFile("avatar", request, "/uploads"));
			}
			user.setPassword(user2.getPassword());
			
			
			this.userDao.update(user);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
