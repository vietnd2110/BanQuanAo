package ploy.edu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import ploy.edu.entities.Order;
import ploy.edu.utils.JpaUtils;

public class OrderDao extends AbstractEntityDao<Order>{
	
	private EntityManager em;
	
	public OrderDao() {
		super(Order.class);
		this.em = JpaUtils.getEntityManager();
	}
	
	public List<Order> fileAllById(int id){
		String jpql = "SELECT o FROM Order o where o.userOder.id = :id";
		
		TypedQuery<Order> query = this.em.createQuery(jpql, Order.class);
		query.setParameter("id", id);
		
		return query.getResultList();
		
	}
	
	public List<Order> fileAll(){
		this.em.clear();
		String jpql = "SELECT o FROM Order o ";
		
		TypedQuery<Order> query = this.em.createQuery(jpql, Order.class);	
		return query.getResultList();
		
	}
}
