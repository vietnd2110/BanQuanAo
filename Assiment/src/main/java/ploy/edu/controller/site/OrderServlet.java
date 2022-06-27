package ploy.edu.controller.site;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ploy.edu.dao.OrderDao;
import ploy.edu.entities.Order;
import ploy.edu.entities.User;
import ploy.edu.utils.SessionUtils;


@WebServlet("/Order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private OrderDao orderDao;
   
    public OrderServlet() {
        super();
       this.orderDao = new OrderDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!SessionUtils.isLogin(request, "user")) {
			response.sendRedirect("/Assiment/Login");
			return;
		}
			
		request.setAttribute("views", "/views/users/features/shoping-cart.jsp");
		request.getRequestDispatcher("/views/users/layout.jsp").forward(request, response);	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!SessionUtils.isLogin(request, "user")) {
			response.sendRedirect("/Assiment/Login");
			return;
		}
		
		Order order = new Order();
		try {
			
			User user = (User) SessionUtils.get(request, "user");
			if(user != null) {
				order.setUserOder(user);
			}
					
			order.setDate(new Date());
			
			order.setStatus(0);
			
//			if(request.getParameter("sum") != null) {
//				double sum = Double.parseDouble(request.getParameter("sum"));				
//				order.setTotal(sum);
//			}
			
			this.orderDao.create(order);
			SessionUtils.set(request, "message", "Đặt Hàng Thành Công");
			
		} catch (Exception e) {
			e.printStackTrace();
			SessionUtils.set(request, "error", "Đặt Hàng Thất Bại");
		}
		
		
		request.setAttribute("views", "/views/users/features/shoping-cart.jsp");
		request.getRequestDispatcher("/views/users/layout.jsp").forward(request, response);		
	}

}
