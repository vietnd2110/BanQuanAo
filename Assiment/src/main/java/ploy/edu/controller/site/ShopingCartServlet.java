package ploy.edu.controller.site;

import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import ploy.edu.dao.CartDao;
import ploy.edu.dao.ProductDao;
import ploy.edu.entities.Cart;
import ploy.edu.entities.Product;
import ploy.edu.entities.User;
import ploy.edu.utils.SessionUtils;

@WebServlet("/ShoppingCart")
public class ShopingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartDao cartDao;
	private ProductDao productDao;

	public ShopingCartServlet() {
		super();
		this.cartDao = new CartDao();
		this.productDao = new ProductDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!SessionUtils.isLogin(request, "user")) {
			response.sendRedirect("/Assiment/Login");

			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!SessionUtils.isLogin(request, "user")) {
			response.sendRedirect("/Assiment/Login");
			return;
		}

		Cart cart = new Cart();
		Product product = new Product();

		if (request.getParameter("idPro") == null) {
			response.sendRedirect("/Assiment/Product");
			return;
		} else {
			int id = Integer.parseInt(request.getParameter("idPro"));
			try {
				// Thiết lập product
				product.setId(id);
				cart.setProduct(product);

				User user = (User) SessionUtils.get(request, "user");
				if (user != null) {
					cart.setUserCart(user);
				}

				// Thiết lập số lượng
				if (request.getParameter("quantity") != null) {
					int so_luong = Integer.parseInt(request.getParameter("quantity"));
					cart.setQuantity(so_luong);
				}

				// Thiết lập màu
				if (request.getParameter("mauSac") != null) {
					String mau_sac = request.getParameter("mauSac");
					cart.setMauSac(mau_sac);
				}

				// Thiết lập kich thước
				if (request.getParameter("kichThuoc") != null) {
					String kich_thuoc = request.getParameter("kichThuoc");
					cart.setKichThuoc(kich_thuoc);
				}

				// thiết lập đơn giá
				Product product2 = this.productDao.findById(id);
				int price = product2.getDonGia();
				cart.setPrice(price);

				// thiết lập thành tiền
				cart.setTotal(cart.getQuantity() * cart.getPrice());

				// thiết lập thời gian
				cart.setDate(new Date());

				this.cartDao.create(cart);

				SessionUtils.set(request, "message", "Thêm Thành Công");
				request.setAttribute("views", "/views/users/product/product.jsp");
				request.getRequestDispatcher("/views/users/layout.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				SessionUtils.set(request, "error", "Thêm Thất Bại");
				response.sendRedirect("/Assiment/Product");
			}
		}
	}

}
