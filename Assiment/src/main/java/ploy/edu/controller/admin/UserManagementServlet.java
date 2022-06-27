package ploy.edu.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import ploy.edu.dao.UserDao;
import ploy.edu.entities.User;
import ploy.edu.utils.EncrytptUtils;
import ploy.edu.utils.SessionUtils;
import ploy.edu.utils.UploadFileUtils;

@MultipartConfig()
@WebServlet({ "/Admin/UserManagement/index","/Admin/UserManagement/store",
           "/Admin/UserManagement/update", "/Admin/UserManagement/delete", })
public class UserManagementServlet extends HttpServlet {
	private UserDao userDao;

	public UserManagementServlet() {
		super();
		this.userDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();

		if (uri.contains("index")) {
			index(request, response);
		}else if (uri.contains("delete")) {
			delete(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();

		if (uri.contains("store")) {
			store(request, response);
		} else if (uri.contains("update")) {
			update(request, response);
		}
	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> list = this.userDao.findAll();
		
		request.setAttribute("list", list);
		request.setAttribute("views", "/views/admin/users/user.jsp");
		request.getRequestDispatcher("/views/admin/layout.jsp").forward(request, response);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		try {
			
			int id = Integer.parseInt(idStr);
			User user = this.userDao.findById(id);
			
			this.userDao.delete(user);
			SessionUtils.set(request, "message", "Xóa Thành Công");
			index(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			SessionUtils.set(request, "error", "Xóa Thất Bại");
		}
	}

	private void store(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User entity = new User();
		try {
			BeanUtils.populate(entity, request.getParameterMap());
			
			String encrutpt = EncrytptUtils.Encrypt(request.getParameter("password"));
		
			entity.setPassword(encrutpt);
			entity.setAvatar(UploadFileUtils.UploadFile("avatar", request, "/uploads"));
						
			this.userDao.create(entity);
			
			SessionUtils.set(request, "message", "Thêm Mới Thành công");
			response.sendRedirect("/Assiment/Admin/UserManagement/index");
		} catch (Exception e) {
			e.printStackTrace();
			SessionUtils.set(request, "error", "Thêm Mới Thất Bại");
			
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		try {
			User entity = new User();
			BeanUtils.populate(entity, request.getParameterMap());
			int id = Integer.parseInt(idStr);
			
			User user = this.userDao.findById(id);
			
			entity.setPassword(user.getPassword());
			
			if(request.getPart("avatar").getSize()==0) {
				entity.setAvatar(user.getAvatar());
			}else {
				entity.setAvatar(UploadFileUtils.UploadFile("avatar", request, "/uploads"));
			}
							
			this.userDao.update(entity);
			
			SessionUtils.set(request, "message", "Cập Nhật Thành công");
			response.sendRedirect("/Assiment/Admin/UserManagement/index");
		} catch (Exception e) {
			e.printStackTrace();
			SessionUtils.set(request, "error", "Cập Nhật Thất Bại");
			response.sendRedirect("/Assiment/Admin/UserManagement/update?id=" + idStr);
		}
	}

}
