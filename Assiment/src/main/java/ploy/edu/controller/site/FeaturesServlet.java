package ploy.edu.controller.site;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ploy.edu.dao.CartDao;
import ploy.edu.entities.Cart;
import ploy.edu.entities.User;
import ploy.edu.utils.SessionUtils;

@WebServlet({ "/Features/index", "/Features/delete" })
public class FeaturesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartDao cartDao;

	public FeaturesServlet() {
		super();
		this.cartDao = new CartDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (!SessionUtils.isLogin(request, "user")) {
			response.sendRedirect("/Assiment/Login");
			return;
		}

		String uri = request.getRequestURI();

		if (uri.contains("index")) {
			index(request, response);
		}else if (uri.contains("delete")) {
			delete(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int idCart = Integer.parseInt(request.getParameter("idCart"));

			Cart cart = this.cartDao.findById(idCart);

			this.cartDao.delete(cart);
			SessionUtils.set(request, "message", "Xóa Thành Công");
			index(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			SessionUtils.set(request, "error", "Xóa Thất Bại");
		}
	}
	
	private void index(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) SessionUtils.get(request, "user");
		if (user != null) {
			int idUser = user.getId();
			List<Cart> liCarts = this.cartDao.fillAllById(idUser);

			double sum = 0;
			for (Cart cart : liCarts) {
				sum = sum + cart.getTotal();
				request.setAttribute("sum", sum);
			}

			request.setAttribute("listCart", liCarts);
		}
		request.setAttribute("views", "/views/users/features/shoping-cart.jsp");
		request.getRequestDispatcher("/views/users/layout.jsp").forward(request, response);
	}

}
