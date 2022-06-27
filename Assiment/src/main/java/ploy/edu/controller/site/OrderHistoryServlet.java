package ploy.edu.controller.site;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ploy.edu.dao.CartDao;
import ploy.edu.dao.OrderDao;
import ploy.edu.entities.Cart;
import ploy.edu.entities.Order;
import ploy.edu.entities.User;
import ploy.edu.utils.SessionUtils;

@WebServlet("/OrderHistory")
public class OrderHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDao orderDao;
	private CartDao cartDao;
       
   
    public OrderHistoryServlet() {
        super();
       this.orderDao = new OrderDao();
       this.cartDao = new CartDao();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!SessionUtils.isLogin(request, "user")) {
			response.sendRedirect("/Assiment/Login");
			return;
		}
		
		User user = (User) SessionUtils.get(request, "user");
		if(user != null) {
			int idUser = user.getId();
			List<Order> orders = this.orderDao.fileAllById(idUser);
			
			List<Cart> lCarts = this.cartDao.fillAllById(idUser);
			
			double sum = 0;
			for (Cart cart : lCarts) {
				 sum = sum + cart.getTotal();
				
			}
			
			request.setAttribute("order", orders);
			request.setAttribute("sum", sum);
		}
			
		
		
		request.getRequestDispatcher("/views/users/features/order-history.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
