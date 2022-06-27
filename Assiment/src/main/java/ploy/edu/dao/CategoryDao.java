package ploy.edu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import ploy.edu.entities.Category;
import ploy.edu.utils.JpaUtils;

public class CategoryDao extends AbstractEntityDao<Category> {

	private EntityManager em;
	
	public CategoryDao() {
		super(Category.class);
		this.em = JpaUtils.getEntityManager();
	}
	
	public List<Category> findAll(){
		this.em.clear();
		String jpql = "SELECT c FROM Category c";
		TypedQuery<Category> query = this.em.createQuery(jpql, Category.class);
		return query.getResultList();
	}
}
