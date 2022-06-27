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
import ploy.edu.dao.UserDao;
import ploy.edu.entities.Cart;
import ploy.edu.entities.Order;
import ploy.edu.entities.User;
import ploy.edu.utils.SessionUtils;

@WebServlet({ "/Admin/OrderManagement/index", "/Admin/OrderManagement/delete", "/Admin/OrderManagement/update", })
public class OrderManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDao orderDao;
	private UserDao userDao;
	private CartDao cartDao;

	public OrderManagementServlet() {
		super();
		this.orderDao = new OrderDao();
		this.userDao = new UserDao();
		this.cartDao = new CartDao();
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
		if (uri.contains("update")) {
			update(request, response);
		}
	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {		
			List<Order> liOrders = this.orderDao.fileAll();
			
			if(request.getParameter("user_id") != null) {
				int idUser = Integer.parseInt(request.getParameter("user_id"));
				
				User user = this.userDao.findById(idUser);
				List<Cart> lCarts = this.cartDao.fillAllById(user.getId());				
				
				double sum = 0;
				for (Cart cart : lCarts) {
					sum = sum + cart.getTotal();
				}
				request.setAttribute("sum", sum);
			}

			request.setAttribute("listOrder", liOrders);
			request.setAttribute("views", "/views/admin/order/order.jsp");
			request.getRequestDispatcher("/views/admin/layout.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idOderStr = request.getParameter("idOder");
		if (request.getParameter("status") != null) {
			try {

				int idOrder = Integer.parseInt(idOderStr);
				Order order = this.orderDao.findById(idOrder);

				int status = Integer.parseInt(request.getParameter("status"));
				order.setStatus(status);

				this.orderDao.create(order);
				SessionUtils.set(request, "message", "Xác Nhận Thành Công");
				index(request, response);

			} catch (Exception e) {
				e.printStackTrace();
				SessionUtils.set(request, "message", "Xác Nhận Thất Bại");
				response.sendRedirect("/Assiment/Admin/OrderManagement/update?idOrder=" + idOderStr);
			}
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idOderStr = request.getParameter("idOrder");
		try {
			int idOrder = Integer.parseInt(idOderStr);
			Order order = this.orderDao.findById(idOrder);

			if (order.getStatus() != 0) {
				SessionUtils.set(request, "message", "Đơn Hàng Này Đã Xác Nhận Không Thể Xóa");
				index(request, response);
			} else {
				this.orderDao.delete(order);
				SessionUtils.set(request, "message", "Hủy Đơn Thành Công");
				index(request, response);
				System.out.println("a");
			}
		} catch (Exception e) {
			e.printStackTrace();
			SessionUtils.set(request, "message", "Hủy Đơn Thất Bại");
			response.sendRedirect("/Assiment/Admin/OrderManagement/delete?idOrder=" + idOderStr);
		}
	}

}
