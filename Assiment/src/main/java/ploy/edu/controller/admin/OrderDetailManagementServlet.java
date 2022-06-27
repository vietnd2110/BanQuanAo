package ploy.edu.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ploy.edu.dao.CartDao;
import ploy.edu.dao.OrderDao;
import ploy.edu.dao.OrderDetailDao;
import ploy.edu.dao.ProductDao;
import ploy.edu.dao.UserDao;
import ploy.edu.entities.Cart;
import ploy.edu.entities.Order;
import ploy.edu.entities.OrderDetail;
import ploy.edu.entities.Product;
import ploy.edu.entities.User;
import ploy.edu.utils.SessionUtils;

@WebServlet({ "/Admin/OrderDetailManagement/index" })
public class OrderDetailManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDetailDao orderDetailDao;
	private ProductDao productDao;
	private OrderDao orderDao;
	private CartDao cartDao;
	private UserDao userDao;

	public OrderDetailManagementServlet() {
		super();
		this.orderDetailDao = new OrderDetailDao();
		this.orderDao = new OrderDao();
		this.productDao = new ProductDao();
		this.cartDao = new CartDao();
		this.userDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("index")) {
			index(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<OrderDetail> lOrderDetails = this.orderDetailDao.fileAll();
			List<Product> lProducts = this.productDao.findAll();
			List<Order> lOrders = this.orderDao.fileAll();

			request.setAttribute("lProducts", lProducts);
			request.setAttribute("lOrders", lOrders);
			request.setAttribute("listOrdetail", lOrderDetails);

			request.setAttribute("views", "/views/admin/order-detail/order-detail.jsp");
			request.getRequestDispatcher("/views/admin/layout.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
