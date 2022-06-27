package ploy.edu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import ploy.edu.entities.Order;
import ploy.edu.entities.OrderDetail;
import ploy.edu.utils.JpaUtils;

public class OrderDetailDao extends AbstractEntityDao<OrderDetail>{

	private EntityManager em;
	
	public OrderDetailDao() {
		super(OrderDetail.class);
		this.em = JpaUtils.getEntityManager();
	}
	
	
	
	public List<OrderDetail> fileAll(){
		String jpql = "SELECT o FROM OrderDetail o";
		
		TypedQuery<OrderDetail> query = this.em.createQuery(jpql, OrderDetail.class);
		
		return query.getResultList();
	}
	
}
