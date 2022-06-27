package ploy.edu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import ploy.edu.entities.Product;
import ploy.edu.utils.JpaUtils;

public class ProductDao extends AbstractEntityDao<Product>{

	private EntityManager em;
	
	public ProductDao() {
		super(Product.class);
		this.em = JpaUtils.getEntityManager();
	}

	public List<Product> findAll(){
		this.em.clear();
		String jpql = "SELECT p FROM Product p";
		TypedQuery<Product> query = this.em.createQuery(jpql, Product.class);
		return query.getResultList();
	}
	
	public List<Product> findAllById(int id){
		String jpql = "SELECT p FROM Product p where p.catego.id = :id";
		TypedQuery<Product> query = this.em.createQuery(jpql, Product.class);
		query.setParameter("id", id);
		
		return query.getResultList();
	}
	
}
