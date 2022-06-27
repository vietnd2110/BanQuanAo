package ploy.edu.controller.site;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ploy.edu.dao.CategoryDao;
import ploy.edu.dao.ProductDao;
import ploy.edu.entities.Category;
import ploy.edu.entities.Product;

@WebServlet("/Product")
public class ProductServlet extends HttpServlet {
	private ProductDao productDao;
	private CategoryDao categoryDao;

	public ProductServlet() {
		super();
		this.productDao = new ProductDao();
		this.categoryDao = new CategoryDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Category> lCategories = this.categoryDao.findAll();
		request.setAttribute("listCategory", lCategories);

		if (request.getParameter("id") != null) {
			try {
				int id = Integer.parseInt(request.getParameter("id"));
				
//				Product product = this.productDao.findById(id);
				List<Product> listProduct = this.productDao.findAllById(id);
				
//				if (id == -1 && listProduct.size() > 0) {
//					id = listProduct.get(0).getId();
//				}
				
				
				request.setAttribute("listProduct", listProduct);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		request.setAttribute("views", "/views/users/product/product.jsp");
		request.getRequestDispatcher("/views/users/layout.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
