package ploy.edu.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import ploy.edu.dao.CategoryDao;
import ploy.edu.dao.ProductDao;
import ploy.edu.entities.Category;
import ploy.edu.entities.Product;
import ploy.edu.utils.SessionUtils;
import ploy.edu.utils.UploadFileUtils;

@MultipartConfig()
@WebServlet({ "/Admin/ProductManagement/index",
              "/Admin/ProductManagement/store",
	          "/Admin/ProductManagement/delete",
		      "/Admin/ProductManagement/update", })
public class ProductManagementServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private ProductDao productDao;
	private CategoryDao categoryDao;

	public ProductManagementServlet() {
		super();
		this.productDao = new ProductDao();
		this.categoryDao = new CategoryDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("index")) {
			index(request, response);
		} else if (uri.contains("delete")) {
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
		List<Product> listProduct = this.productDao.findAll();
		List<Category> listCategory = this.categoryDao.findAll();

		request.setAttribute("listPro", listProduct);
		request.setAttribute("listCategory", listCategory);

		request.setAttribute("views", "/views/admin/products/product.jsp");
		request.getRequestDispatcher("/views/admin/layout.jsp").forward(request, response);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idProduct = Integer.parseInt(request.getParameter("id"));
		try {
			Product product = this.productDao.findById(idProduct);

			this.productDao.delete(product);
			
			SessionUtils.set(request, "message", "Xóa Thành Công");
			index(request, response);
		} catch (Exception e) {
			SessionUtils.set(request, "error", "Xóa Thất bại");
			e.printStackTrace();
		}
	}

	private void store(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product product = new Product();
		int idCategory = Integer.parseInt(request.getParameter("category_id"));
		try {
			BeanUtils.populate(product, request.getParameterMap());

			Category category = this.categoryDao.findById(idCategory);
			product.setCatego(category);
			
			product.setImg(UploadFileUtils.UploadFile("img", request, "/uploads"));
			
			this.productDao.create(product);
			SessionUtils.set(request, "message", "Thêm Mới Thành Công");
			index(request, response);
		} catch (Exception e) {
			SessionUtils.set(request, "eror", "Thêm Mới Thất bại");
			e.printStackTrace();
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		int idProduct = Integer.parseInt(request.getParameter("id"));
		int idCategory = Integer.parseInt(request.getParameter("category_id"));
		Product product = new Product();
		try {
			Product productOld = this.productDao.findById(idProduct);
			BeanUtils.populate(product, request.getParameterMap());
			
			Category category = this.categoryDao.findById(idCategory);
			product.setCatego(category);
			
			
			if(request.getPart("img").getSize() == 0) {
				product.setImg(productOld.getImg());
			}else {
				product.setImg(UploadFileUtils.UploadFile("img", request, "/uploads"));
			}
			
			this.productDao.update(product);
			
			SessionUtils.set(request, "message", "Cập Nhật Thành Công");
			response.sendRedirect("/Assiment/Admin/ProductManagement/index");
		} catch (Exception e) {
			SessionUtils.set(request, "eror", "Cập Nhật Thất Bại");
			e.printStackTrace();
			response.sendRedirect("/Assiment/Admin/ProductManagement/update=" + idProduct);
		}
	}
}
