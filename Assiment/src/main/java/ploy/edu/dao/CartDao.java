package ploy.edu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import ploy.edu.entities.Cart;
import ploy.edu.utils.JpaUtils;

public class CartDao extends AbstractEntityDao<Cart>{

	private EntityManager em;
	
	public CartDao() {
		super(Cart.class);
		this.em = JpaUtils.getEntityManager();
	}
	
	public List<Cart> fillAllById(int id){
		this.em.clear();
		String jpql = "SELECT c FROM Cart c where c.userCart.id = :id";
		
		TypedQuery<Cart> query = this.em.createQuery(jpql, Cart.class);
		query.setParameter("id", id);
		
		return query.getResultList();
		
	}
	
	public List<Cart> fillAll(){
		this.em.clear();
		
		String jpql = "SELECT c FROM Cart c";	
		TypedQuery<Cart> query = this.em.createQuery(jpql, Cart.class);
			
		return query.getResultList();
		
	}
}
