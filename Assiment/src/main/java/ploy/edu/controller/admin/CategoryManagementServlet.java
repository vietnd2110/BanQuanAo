package ploy.edu.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import ploy.edu.dao.CategoryDao;
import ploy.edu.dao.UserDao;
import ploy.edu.entities.Category;
import ploy.edu.entities.User;
import ploy.edu.utils.SessionUtils;

@WebServlet({
	       "/Admin/CategoryManagement/index",
	       "/Admin/CategoryManagement/store",
	       "/Admin/CategoryManagement/update",
	       "/Admin/CategoryManagement/delete",
	       })
public class CategoryManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private CategoryDao categoryDao;
      private UserDao userDao;
   
    public CategoryManagementServlet() {
        super();
       this.categoryDao = new CategoryDao();
       this.userDao = new UserDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("index")) {
			index(request, response);
		}else if(uri.contains("delete")) {
			delete(request, response);
		}		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("update")) {
			update(request, response);
		}else if(uri.contains("store")) {
			store(request, response);
		}
	}
	
	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Category> listCate = this.categoryDao.findAll();
		List<User> listUser = this.userDao.findAll();
		
		request.setAttribute("listCate", listCate);
		request.setAttribute("listUser", listUser);
		
		request.setAttribute("views", "/views/admin/category/category.jsp");
		request.getRequestDispatcher("/views/admin/layout.jsp").forward(request, response);
	}
	
	protected void store(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		int idUser = Integer.parseInt(request.getParameter("user_id"));
		Category category = new Category();
		try {			
			BeanUtils.populate(category, request.getParameterMap());
			
			User user = this.userDao.findById(idUser);	
			category.setUser(user);
			
			this.categoryDao.create(category);
			SessionUtils.set(request, "message", "Thêm Mới Thành Công");
			response.sendRedirect("/Assiment/Admin/CategoryManagement/index");
		} catch (Exception e) {
			e.printStackTrace();
			SessionUtils.set(request, "error", "Thêm Mới Thất Bại");
		}
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idUser = Integer.parseInt(request.getParameter("user_id"));
		int idCate = Integer.parseInt(request.getParameter("id"));

		try {           
            Category category = this.categoryDao.findById(idCate);
            BeanUtils.populate(category, request.getParameterMap());
            
            User user = this.userDao.findById(idUser);
            category.setUser(user);
			
			this.categoryDao.update(category);
			SessionUtils.set(request, "message", "Cập Nhật Thành Công");
			response.sendRedirect("/Assiment/Admin/CategoryManagement/index");
		} catch (Exception e) {
			e.printStackTrace();
			SessionUtils.set(request, "error", "Cập Nhật Thất bại");
			response.sendRedirect("/Assiment/Admin/CategoryManagement/update?id=" + idCate);
		}
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			Category category =  this.categoryDao.findById(id);
			
			this.categoryDao.delete(category);
			
			SessionUtils.set(request, "message", "Xóa Thành Công");
			index(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			SessionUtils.set(request, "error", "Xóa Thất bại");
		}
	}
	
	

}
